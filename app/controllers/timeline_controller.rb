class TimelineController < ApplicationController
	def index
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    @events = Sorter.group_by_date(all_events)
	end

  def poll
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    @events = Sorter.group_by_date(all_events)
    render :json => @events
  end
end
