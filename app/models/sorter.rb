class Sorter
	def self.group_by_date(all_events)
		all_events.group_by { |event| event.published_at }
	end
end