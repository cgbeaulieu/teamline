class Timeline
  Events = ['GhEvent', 'Post', 'Tweet']

  attr_accessor :events

  def load_recent_events(from, current_team)
    query_date = from.days.ago.to_date.to_s
    team_id = current_team.id
    @events = Events.map { |class_name| class_name.constantize.team(team_id).where("published_at > ?", query_date ).order('published_at DESC')}.
      flatten
      self.events = self.events.sort_by {|event| event.published_at}.reverse
  end
  
  def find_new_events(date, current_team)
    query_date = DateTime.parse(date) + 1.seconds
    team_id = current_team.id
    @events = Events.map { |class_name| class_name.constantize.team(team_id).
      where('published_at > ?', query_date) }.flatten
  end

  def get_next_day(params, current_team)
    date = params[:published_at]
    person_ids = params.fetch(:filter, {}).fetch('person_ids', nil)
    types      = params.fetch(:filter, {}).fetch('type', nil) || Events
    
    date = DateTime.parse(date).yesterday
    start_date = date.at_beginning_of_day
    end_date   = date.end_of_day
    team_id = current_team.id
    
    if person_ids
      search_with_person_ids(person_ids, start_date, end_date, types, team_id)
    else
      search_without_person_ids(start_date, end_date, types, team_id)
    end
  end

  def filter(params)
    person_ids = params.fetch(:filter, {}).fetch('person_ids', nil)
    types      = params.fetch(:filter, {}).fetch('type', nil) || Events
    start_date   = params.fetch('start_date', nil) || nil

    if start_date.present?
      start_date = start_date.to_date.at_beginning_of_day
      end_date   = start_date.end_of_day
    else
      start_date = DateTime.now - 10.days
      end_date   = DateTime.now + 1.day
    end

    if person_ids
      search_with_person_ids(person_ids, start_date, end_date, types)
    else
      search_without_person_ids(start_date, end_date, types)
    end
  end

  #search each person passed, with or without date, for any type of event
  def search_with_person_ids(person_ids, start_date, end_date, types, team_id)
    self.events = person_ids.map do |person_id|
      types.map do |type|
        type.constantize.team(team_id).
          where("person_id = ? AND published_at >= ? AND published_at <= ?", person_id, start_date, end_date)
      end
    end.flatten
  end

  #specific types or no types with or without date range
  def search_without_person_ids(start_date, end_date, types, team_id)
    self.events = types.map do |type|
      type.constantize.team(team_id).where("published_at >= ? AND published_at <= ?", start_date, end_date)
    end.flatten
  end

  def group_by_date
    return if self.events.nil?
    self.events = self.events.group_by { |event| format_published_at(event) }
    format_grouped_events
  end

  def format_grouped_events
    formatted = self.events.map { |date, events| [date, events] }
    self.events = formatted.sort_by { |el| el[0] }.reverse
  end


  def sort_events_descending
    self.events = self.events.sort_by { |event| event.published_at }.reverse
  end


  private
  
    def format_published_at(event)
      event.published_at.to_s(:db).split(" ").first 
    end
end
