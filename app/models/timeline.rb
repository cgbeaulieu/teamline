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

  def get_next_day(date)
    date = DateTime.parse(date).yesterday
    start_of = date.at_beginning_of_day
    end_of   = date.end_of_day

    self.events = Events.map { |class_name| class_name.constantize.
      where('published_at >= ? and published_at <= ?', start_of, end_of) }.flatten 
  end

  def sort_events_descending
    self.events.sort_by { |event| event.published_at }.reverse
  end
# { 
#   "person_ids"=>["1", "3"],
#   "type"=>["Post", "Tweet"],
#   "published_at"=>"13 November, 2012"
#  }
  def filter(params)
    ids   = params[:filter].fetch('person_ids')   #=> ['1', '2']
    types = params[:filter].fetch('type')         #=> ["Post", "Tweet"]
    date  = params.fetch('published_at') #=> "13 November, 2012"
    if ids
      self.events = ids.map do |id|
        fetch_with_id(id, types, date)
      end.flatten
    elsif types
    elsif date
    end
  end

  def fetch_with_id(id, types=Events, date=nil)
    start_of = date.to_date.at_beginning_of_day
    end_of   = date.to_date.end_of_day
    
    if date
      types.map { |class_name| class_name.constantize.
        where("person_id = ? AND published_at >= ? AND published_at <= ?", id, start_of, end_of) }
    else
      types.map { |class_name| class_name.constantize.where("person_id = ?", id) }
    end
  end

  def filter_events_by_date(date)
    start_of = date.to_date.at_beginning_of_day
    end_of   = date.to_date.end_of_day

    self.events = Events.map { |class_name| class_name.constantize.
      where('published_at >= ? and published_at <= ?', start_of, end_of) }.flatten 
  end

  def filter_events_by_type(types)
    self.events = types.map { |class_name| class_name.constantize.order('published_at DESC').
      limit(10)}.flatten
  end

  def filter_events_by_people(people)
    people_events = people.each_with_object([]) do |person_id, array|
      array << Events.map {|class_name| class_name.constantize.where("person_id = ?", person_id) }
    end
    self.events = people_events.flatten
  end

  private
  
    def format_published_at(event)
      event.published_at.to_s(:db).split(" ").first 
    end

    def parse_date(date)
      DateTime.parse(date) + 1.seconds
    end

    def parse_filter_date(date)
      # date.to_date.at_beginning_of_day
      # DateTime.parse(date)
    end
end
