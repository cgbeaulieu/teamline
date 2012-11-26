class Sorter
	def self.group_by_date(events)
		events.group_by { |event| event.published_at.to_s(:db).split(" ").first}
	end

  def self.sort_by_published_at(events)
    events.sort_by { |event| event.published_at }.reverse
  end
  
  def self.sort_by_published_at_asc(events)
    events.sort_by { |event| event.published_at }
  end
  
  def self.sort_by_created_at(events)
    events.sort_by { |event| event.created_at }  
  end

  def self.sort_and_group_by_published_at(events)
    eventgroup = sort_by_published_at(events)
    group_by_date(eventgroup)
  end

  def self.sorted_hash_to_array(events_hash) 
    events_hash.map{|date, events| [date, events]}
  end

end
