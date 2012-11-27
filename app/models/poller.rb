# # TODO: This pattern is weird, it's all class methods
# # should be a module. Or if it's a class it's usage
# # is wrong.

# class Poller
#   def self.find_new_events(published_at)
#     query_date = DateTime.parse(published_at) + 1.seconds
#     detect_new_events(query_date)
#   end

#   def self.detect_new_events(query_date)
#     classes = ['GhEvent', 'Post', 'Tweet']
#     # TODO: That's cool but it should be a do end block for style
#     classes.map {|class_name| 
#       class_name.constantize.
#       where('published_at > ?', query_date) 
#     .}flatten
#   end
# end
