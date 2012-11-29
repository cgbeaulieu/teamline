class Timeline
  Events = ['GhEvent', 'Post', 'Tweet']

  attr_accessor :events

  def load_recent_events(from)
    query_date = from.days.ago.to_date.to_s
    @events = Events.map { |class_name| class_name.constantize.where("published_at > ?", query_date ).order('published_at DESC')}.
      flatten
      self.events = self.events.sort_by {|event| event.published_at}.reverse
  end
  
  def group_by_date
    self.events = self.events.group_by { |event| format_published_at(event) }
    format_grouped_events
  end

  def format_grouped_events
    formatted = self.events.map { |date, events| [date, events] }
    self.events = formatted.sort_by { |el| el[0] }.reverse
  end

  def find_new_events(date)
    query_date = parse_date(date)
    @events = Events.map { |class_name| class_name.constantize.
      where('published_at > ?', query_date) }.flatten
  end

  def sort_events_descending
    self.events.sort_by { |event| event.published_at }.reverse
  end

  def filter(type, params)
    #delegates to the correct filter action
  end

  def filter_events_by_date(date)
    self.events = Events.map { |class_name| class_name.constantize.
      where('published_at LIKE ?', "#{date}%") }.flatten 
  end

  def filter_events_by_type(types)
    self.events = types.map { |class_name| class_name.constantize.order('published_at DESC').
      limit(10)}.flatten
  end

  private
  
    def format_published_at(event)
      event.published_at.to_s(:db).split(" ").first 
    end

    def parse_date(date)
      DateTime.parse(date) + 1.seconds
    end

    def parse_filter_date(date)
      DateTime.parse(date)
    end
end
