class TimelineController < ApplicationController
  before_filter :current_team

  def index
    timeline = Timeline.new(2.days.ago.to_date.to_s)
    timeline.load_recent_events(@current_team.id)
    timeline.group_by_date
    @grouped_events = timeline.events
  end

  def poll
    timeline = Timeline.new(DateTime.parse(params.fetch(:published_at, Time.now) + 1.seconds)
    timeline.find_new_events(@current_team.id)
    timeline.sort_events_descending
    @content = render_to_string :partial => "poll_event", :locals => {:grouped_events => timeline.events}
    render :json => @content.to_json
  end

  def infinite
    date = DateTime.parse(params.fetch(:published_at, Time.now)).yesterday
    timeline = Timeline.new(date.at_beginning_of_day, date.end_of_day)
    timeline.query(params)
    timeline.group_by_date
    @content = render_to_string :partial => "event", :locals => {:grouped_events => timeline.events}
    render :json => @content.to_json
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
      @content = render_to_string :partial => "event", :locals => {:grouped_events => timeline.events}
      render :json => @content.to_json
    end
  end
end

