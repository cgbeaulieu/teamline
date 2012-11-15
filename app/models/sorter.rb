class Sorter
	def self.group_by_date(events)
		events.group_by { |event| event.published_at.to_s(:db)}
	end
end