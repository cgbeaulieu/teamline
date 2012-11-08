class OctokitWrapper
  # attr_accessible :title, :body

  def get_gh_events(ghuser)
  	Octokit.user_events(ghuser).each {|event| GhEvent.create(:eventdate => event.created_at, :category => event.type) }  		  
  end

end