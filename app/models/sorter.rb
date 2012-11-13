class Sorter
	def self.group_by_date
		all_events = [GhEvent.all, Post.all, Tweet.all].flatten
		all_events.group_by { |event| event.published_at }
	end
end