class OctokitWrapper
  def self.get_gh_events(ghuser)
    begin
      Octokit.user_events(ghuser).each do |event| 
        self.parse_content(event) 
      end
    rescue => e
      puts e.inspect
    end
  end

  def self.parse_content(event)
    if GithubEvent::VALID_EVENTS.include?(event.type) 
      e = event.type.constantize.new(event)
      e.create_gh_event
    end
  end

end
