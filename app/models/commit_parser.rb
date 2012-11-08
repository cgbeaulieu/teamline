class CommitParser < ActiveRecord::Base
  # attr_accessible :title, :body

  	# Give Octokit a user name
	# Octokit pulls all repos gem 
	# for each repo
		# Octokit.commits("seldomatt/pitchforked")
		# first.commit.committer.date
	# fist bump and twerk when works	

	def repo_parser(username)
		repos = Octokit.repos(username).map {|repo| repo.name}
	end

	def commit_parser(username, repos)
		repos.each do |repo|
			Octokit.commits(username + "/" + repo)
		end
	end

end


  def self.posts_from_feed(feedurl)
    feed = Feedzirra::Feed.fetch_and_parse(feedurl)
    feed.entries.each{|entry| Post.create(:title => entry.title, :content => entry.content, :url => entry.url, :created_at => entry.published)}
  end
