DateRange = Struct.new(:start_date, :end_date)

class Timeline
  Events = ['GhEvent', 'Post', 'Tweet']

  attr_accessor :events, :date_range

  def initialize(start_date=default_start_date, end_date=default_end_date)
    @date_range = DateRange.new(start_date, end_date)
  end

  def load_recent_events(team_id)
    unsorted_events = query_recent(team_id)
    @events = sort_by_published_at(unsorted_events)
  end

  def find_new_events(team_id)
    @events = query_for_new(team_id)
  end

  def query(params)
    person_ids = params.fetch('person_ids', nil)
    types      = params.fetch('type', nil) || Events

    if person_ids
      search_with_person_ids(person_ids, types)
    else
      search_without_person_ids(types)
    end
  end

  def group_by_date
    return if self.events.nil?
    self.events = self.events.group_by { |event| format_published_at(event) }
    format_grouped_events
  end

  def sort_events_descending
    self.events = self.events.sort_by { |event| event.published_at }.reverse
  end

  private

  def search_with_person_ids(person_ids, types)
    self.events = person_ids.map do |person_id|
      types.map do |type|
        type.constantize.
          where("person_id = ? AND published_at >= ? AND published_at <= ?", person_id, date_range.start_date, date_range.end_date)
      end
    end.flatten
  end

  def search_without_person_ids(types)
    self.events = types.map do |type|
      type.constantize.where("published_at >= ? AND published_at <= ?", date_range.start_date, date_range.end_date)
    end.flatten
  end

  def query_recent(team_id)
    Events.map { |class_name| class_name.constantize.team(team_id).where("published_at > ?", date_range.start_date).order('published_at DESC')}.flatten
  end

  def query_for_new(team_id)
    Events.map { |class_name| class_name.constantize.team(team_id).
      where('published_at > ?', date_range.start_date) }.flatten
  end

  def sort_by_published_at(unsorted_events)
    unsorted_events.sort_by { |event| event.published_at }.reverse
  end

  def format_published_at(event)
    event.published_at.to_s(:db).split(" ").first
  end

  def format_grouped_events
    formatted = self.events.map { |date, events| [date, events] }
    self.events = formatted.sort_by { |el| el[0] }.reverse
  end

  def default_end_date
    (Date.today + 1.day).to_s
  end

  def default_start_date
    (Date.today - 10.days).to_s
  end
end
