class TimelineController < ApplicationController
	def index
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    @events = Sorter.sort_by_published_at(all_events)
  end

  def poll
    if params[:created_at]
      # 2012-11-15 18:32:42
      query_date = DateTime.parse(params[:created_at])+2.seconds
      
      gh_events = GhEvent.where('created_at > ?', query_date)
      posts = Post.where('created_at > ?', query_date)
      tweets = Tweet.where('created_at > ?', query_date)
      # @events = Tweet.where('created_at > ?', DateTime.parse(params[:created_at]).advance(seconds: 1))

      new_events = [tweets, posts, gh_events].flatten
      
      @events = Sorter.sort_by_created_at(new_events)
      render :json => @events
    end
  end
end

# puts "RETURNED #{DateTime.parse(params[:created_at]).advance(seconds: 1)}"
# puts "RETURNED #{@events.count} TWEETS"
# puts "RETURNED #{@events.inspect}"
# 2012-11-15 18:32:43 UTC

"2012-11-15T14:47:38-05:00"