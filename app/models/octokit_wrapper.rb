class OctokitWrapper
  def self.get_gh_events(ghuser)
    Octokit.user_events(ghuser).each { |event| self.parse_content(event) }
  end

  # TODO: There is a way to refactor this using subclasses
  # it's hard and not important but in theory
  # if there was a class defined PushEvent < OctoKitEvents
  # then you just constantize (turn the string 'PushEvent')
  # into the actual ruby class and then call a method on it
  # so each subclass defines it's own parser
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
