class TimelineController < ApplicationController
  before_filter :current_team

  def index
    timeline = Timeline.new(2.days.ago.to_date.to_s)
    timeline.load_recent_events(@current_team.id)
    timeline.group_by_date
    @grouped_events = timeline.events
  end

  def poll
    if params[:published_at]
      date = params[:published_at]
      timeline = Timeline.new(DateTime.parse(date) + 1.seconds)
      timeline.find_new_events(@current_team.id)
      timeline.sort_events_descending
      @json = render_to_string :partial => "poll_event", :locals => {:grouped_events => timeline.events}
      render :json => @json.to_json
    else
      render :json => 'empty'
    end
  end

  def infinite
    if params[:published_at]
      date = DateTime.parse(params[:published_at]).yesterday
      timeline = Timeline.new(date.at_beginning_of_day, date.end_of_day)
      timeline.query(params)
      timeline.group_by_date
      @json = render_to_string :partial => "event", :locals => {:grouped_events => timeline.events}
      render :json => @json.to_json
    else
      render :json => 'empty'
    end
  end

  def filter
    if params[:filter] || params.key?('start_date')
      start_date = params.fetch('start_date', nil)
      if start_date
        start_date = start_date.to_date.at_beginning_of_day
        end_date   = start_date.end_of_day
        timeline = Timeline.new(start_date, end_date)
      else
        timeline = Timeline.new(2.days.ago.to_date.to_s)
      end

      timeline.query(params.fetch(:filter, nil))
      timeline.group_by_date
      @json = render_to_string :partial => "event", :locals => {:grouped_events => timeline.events}
      render :json => @json.to_json
    end
  end
end

