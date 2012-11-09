class OctokitWrapper
  # attr_accessible :title, :body

  def self.get_gh_events(ghuser)
  	Octokit.user_events(ghuser).each {|event| GhEvent.create_from_octokit_event(event) }  		  
  end

  # def get_gh_events(ghuser_array)
  #   ghuser_array.map do |ghuser|
  #     Octokit.user_events(ghuser)
  #     #some type of update method
  #   end
  # end

end

