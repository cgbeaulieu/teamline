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
    when 'PushEvent'
      name = event.actor.login
      repo_name = event.repo.name
      commit_messages = event.payload.commits.first.message
      sha = event.payload.commits.first.sha
      commit_links = "http://www.github.com/#{name}/#{repo_name}/commit/#{sha}"
      content_string = "#{name} pushed to #{repo_name}"
      event.content = event.repo.name

    when 'CreateEvent'
      name = event.actor.login
      repo_name = event.repo.name
      description = event.payload.description
      repo_link = "http://www.github.com/#{name}/#{repo_name}"

      event.content = "#{name} created #{repo_name}: #{description}"
    when 'GistEvent'
      name = event.actor.login
      description = event.payload.gist.description
      link = event.payload.gist.html_url

      event.content = "#{name} created a new gist: #{description}"
    when 'PullRequestEvent'
      patch_url = event.payload.pull_request.patch_url
      title = event.payload.pull_request.title
      
      event.content = "#{name} had a Pull Request Event: #{title}, #{patch_url}"
    else
      ignore_event = true
    end
     self.create_gh_event(event) unless ignore_event
  end
end