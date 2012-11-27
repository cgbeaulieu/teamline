class TimelineController < ApplicationController
	def index
    timeline = Timeline.new
    timeline.load_recent_events(20)
    grouped_events = timeline.group_by_date
    @grouped_events = grouped_events.paginate(:page => params[:page], :per_page => 5)
  end

  def poll
    if params[:published_at]
      timeline = Timeline.new
      timeline.find_new_events(params[:published_at])
      @sorted_events = timeline.sort_events_ascending
      #TODO: Render HTML instead of JSON
      render :json => @sorted_events
      # render :json => render_to_string(@events)
    else
      render :json => 'empty'
    end
  end

  def filter
    #params => some 
  end
end
