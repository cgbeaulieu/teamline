class OctokitWrapper
  def self.get_gh_events(ghuser)
  	Octokit.user_events(ghuser).each {|event| GhEvent.create_from_octokit_event(event)}  		  
  end
end

