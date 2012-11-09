class TimelineController < ApplicationController
	def index
		posts = Post.all
		tweets = Tweet.all
		@events = GhEvent.all
		# @events = posts << tweets << gh_events
		# @events.flatten.sort_by!{|thing| thing.published_at }.reverse
	end
end
