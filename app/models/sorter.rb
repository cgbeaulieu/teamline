class Sorter
	def self.group_by_date(events)
		events.group_by { |event| event.published_at }
	end
end