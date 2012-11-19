class TimelineController < ApplicationController
	def index
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    @events = Sorter.sort_by_published_at(all_events).paginate(:page => params[:page], :per_page => 20)
  end

  def poll
    if params[:published_at]
      new_events = Poller.find_new_events(params[:published_at])
      @events = Sorter.sort_by_published_at_asc(new_events)
      render :json => @events
      # raise @events.first.to_json
    else
      render :json => 'empty'
    end
  end
end