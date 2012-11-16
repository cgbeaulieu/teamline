class OctokitWrapper
  def self.create_gh_event(event)
    GhEvent.create_from_octokit_event(event)
  end

  def self.get_gh_events(ghuser)
    begin
  	Octokit.user_events(ghuser).each { |event| self.parse_content(event) }  		  
    rescue => e
      puts "Rate limit exceeded"
    end
  end

  def self.parse_content(event)
    ignore_event = false
    case event.type
    when 'WatchEvent'
      event.content = event.repo.url
    when 'FollowEvent'
      event.content = event.payload.target.login
    when 'ForkEvent'
      event.content = event.repo.name
    when 'PushEvent'
      event.content = event.repo.name
    when 'CreateEvent'
      event.content = event.payload.description
    when 'GistEvent'
      event.content = event.payload.gist.description
    when 'PullRequestEvent'
      event.content = event.payload.pull_request.patch_url
    else
      ignore_event = true
    end
     self.create_gh_event(event) unless ignore_event
  end
end