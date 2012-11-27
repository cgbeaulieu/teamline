class TimelineController < ApplicationController
	def index
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    sorted_events = Sorter.sort_and_group_by_published_at(all_events)
    @events = Sorter.sorted_hash_to_array(sorted_events).paginate(:page => params[:page], :per_page => 5)
  end

  def poll
    if params[:published_at]
      new_events = Poller.find_new_events(params[:published_at])
      @events = Sorter.sort_by_published_at_asc(new_events)
      render :json => @events
    else
      render :json => 'empty'
    end
  end
end