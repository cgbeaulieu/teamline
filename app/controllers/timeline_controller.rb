class TimelineController < ApplicationController
	def index
    timeline = Timeline.new
    timeline.load_recent_events(3)
    timeline.group_by_date
    @grouped_events = timeline.events
  end

  def poll
    if params[:published_at]
      timeline = Timeline.new
      timeline.find_new_events(params[:published_at])
      timeline.sort_events_descending
      @grouped_events = timeline.events
      @json = render_to_string :partial => "poll_event", :locals => {:grouped_events => @grouped_events}
      render :json => @json.to_json
    else
      render :json => 'empty'
    end
  end

  def infinite
    if params[:published_at]
      timeline = Timeline.new
      timeline.get_next_day(params[:published_at])
      timeline.group_by_date
      @grouped_events = timeline.events
      @json = render_to_string :partial => "event", :locals => {:grouped_events => @grouped_events}
      render :json => @json.to_json      
    else
      render :json => 'empty'
    end
  end

  def filter
    if params[:filter] || params.key?('start_of')
      timeline = Timeline.new
      timeline.filter(params)
      timeline.group_by_date
      @grouped_events = timeline.events
      @json = render_to_string :partial => "event", :locals => {:grouped_events => @grouped_events}
      render :json => @json.to_json
    end
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
