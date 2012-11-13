class TimelineController < ApplicationController
	def index
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    @events = Sorter.group_by_date(all_events)
	end
end
