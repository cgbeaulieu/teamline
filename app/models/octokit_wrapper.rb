class OctokitWrapper
  def self.get_gh_events(ghuser)
    Octokit.user_events(ghuser).each { |event| self.parse_content(event) }
  end

  def self.parse_content(event)
    # if GithubEvent::VALID_EVENTS.include?(event.type)
    begin 
      e = event.type.constantize.new(event)
      e.create_gh_event 
    rescue NameError
    end
  end

  def self.create_gh_event(event)
    GhEvent.create_from_octokit_event(event)
  end
end
