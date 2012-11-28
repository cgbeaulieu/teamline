class TimelineController < ApplicationController
	def index
    timeline = Timeline.new
    timeline.load_recent_events(5)
    # raise timeline.events.inspect
    timeline.group_by_date
    @grouped_events = timeline.events.paginate(:page => params[:page], :per_page => 5)
  end

  def poll
    if params[:published_at]
      timeline = Timeline.new
      timeline.find_new_events(params[:published_at])
      timeline.group_by_date
      @grouped_events = timeline.events
      #TODO: Render HTML instead of JSON
      @json = render_to_string :partial => "event", :locals => {:grouped_events => @grouped_events}
      render :json => @json
    else
      render :json => 'empty'
    end
  end

  def filter
    date = params[:date]
    timeline = Timeline.new
    timeline.filter_events_by_date(date)
    grouped_events = timeline.group_by_date
    @grouped_events = grouped_events.paginate(:page => params[:page], :per_page => 5)
    render :index
  end
  
end
# @json = @events.map do |e|
#   {
#     :event => e,
#     :html => render_to_string(:partial => 'events/event', :e => e)
#   }
# @json = {
#   :events => @events,
#   :html => render_to_string('events')
# }
# end
# render :json => @json


# @m = render_to_string :template => "template", :locals => {:sender => sender}
