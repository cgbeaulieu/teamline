class Sorter
	def self.group_by_date(events)
		events.group_by { |event| event.published_at.to_s(:db)}
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
end
