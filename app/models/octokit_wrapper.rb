class OctokitWrapper
  def self.create_gh_event(event)
    GhEvent.create_from_octokit_event(event)
  end

  def self.get_gh_events(ghuser)
    begin
      Octokit.client_id = GITHUB_ID
      Octokit.client_secret = GITHUB_SECRET
      Octokit.user_events(ghuser).each { |event| self.parse_content(event) }
    rescue => e
      puts "Rate limit exceeded"
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
end