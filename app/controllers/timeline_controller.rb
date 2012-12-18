class TimelineController < ApplicationController
  # before_filter :teams_only
  before_filter :current_team

	def index
    timeline = Timeline.new
    timeline.load_recent_events(3, @current_team)
    timeline.group_by_date
    # debugger
    @grouped_events = timeline.events
  end

  def poll
    if params[:published_at]
      timeline = Timeline.new
      timeline.find_new_events(params[:published_at], @current_team)
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
      timeline.get_next_day(params, @current_team)
      timeline.group_by_date
      @grouped_events = timeline.events
      @json = render_to_string :partial => "event", :locals => {:grouped_events => @grouped_events}
      render :json => @json.to_json      
    else
      render :json => 'empty'
    end
  end

  def filter
    if params[:filter] || params.key?('start_date')
      timeline = Timeline.new
      timeline.filter(params, @current_team)
      timeline.group_by_date
      @grouped_events = timeline.events
      @json = render_to_string :partial => "event", :locals => {:grouped_events => @grouped_events}
      render :json => @json.to_json
    end
  end
  
end

