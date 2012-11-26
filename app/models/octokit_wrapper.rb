class OctokitWrapper
  def self.create_gh_event(event)
    GhEvent.create_from_octokit_event(event)
  end

  def self.get_gh_events(ghuser)
    begin
      url    = create_url(ghuser)
      events = fetching_user_events(url)

      events.each { |event| self.parse_content(event) }
    rescue => e
      puts "Rate limit exceeded"
    end
  end

  def fetching_user_events(url)
    response = HTTParty.get(url)
    
    if response.headers['link'].match /next/
      link = response.headers['link']
      link.slice!(/>.+$/)
      link.slice!(/</)
      JSON.parse(response.body) + fetching_user_events(link)
    else
      JSON.parse(response.body)
    end
  end

  def self.parse_content(event)
    ignore_event = false
    case event.type
    when 'PushEvent'
      commit_messages = event['payload']['commits'].map { |commmit| commit.message }.join(',')
      
      event.headline = "#{event.actor.login} pushed to #{event.repo.name}"
      event.content  = commit_messages
      event.url      = "http://www.github.com/#{event.actor.login}/#{event.repo.name}"
    when 'CreateEvent'
      event.headline = "#{event.actor.login} created #{event.repo.name}"
      event.content  = event.payload.description
      event.url      = "http://www.github.com/#{event.actor.login}/#{event.repo.name}"
    when 'GistEvent'
      event.headline = "#{event.actor.login} created a new gist"
      event.content  = event.payload.gist.description
      event.url      = event.payload.gist.html_url
    when 'PullRequestEvent'
      event.headline = "#{event.actor.login} #{event.payload.action} a Pull Request for #{event.repo.name}" 
      event.content  = event.payload.pull_request.title
      event.url      = event.payload.pull_request.diff_url
    else
      ignore_event = true
    end
     self.create_gh_event(event) unless ignore_event
  end

  def self.create_url(ghuser)
    id = 'dc7f6a9b8f696bbe50f8'
    secret = 'ded6e57d0547445c9a854d81f28e868f190ed4de'
    "https://api.github.com/users/#{ghuser}/events/public?page=1&client_id=#{id}&client_secret=#{secret}"
  end
end