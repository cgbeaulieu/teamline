class Poller
  def self.find_new_events(published_at)
    query_date = DateTime.parse(published_at) + 1.seconds
    detect_new_events(query_date)
  end
  
  def self.detect_new_events(query_date)
    classes = ['GhEvent', 'Post', 'Tweet']
    classes.map { |class_name| class_name.constantize.where('published_at > ?', query_date) }.flatten
  end
end
