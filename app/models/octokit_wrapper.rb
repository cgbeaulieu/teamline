class OctokitWrapper
  def self.get_gh_events(ghuser)
  	Octokit.user_events(ghuser).each { |event| self.parse_and_create(event) }  		  
  end

  def self.parse_and_create(event)
    exit = false
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
      exit = true
    end
    GhEvent.create_from_octokit_event(event) unless exit
  end
end