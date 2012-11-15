class TimelineController < ApplicationController
	def index
    # all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    all_events = Tweet.all
    @events = Sorter.group_by_date(all_events)
  end

  def poll
    # gh_events = GhEvent.where('created_at > ?', params[:created_at])
    # posts = Post.where('created_at > ?', params[:created_at])
    @events = Tweet.where('created_at > ?', DateTime.parse(params[:created_at]).advance(seconds: 1))
    # new_events = Tweet.where('content = ?','TEST')
    # new_events = [tweets, posts, gh_events].flatten
    # @events = Sorter.group_by_date(all_events)

    render :json => @events
  end
end

# puts "RETURNED #{DateTime.parse(params[:created_at]).advance(seconds: 1)}"
# puts "RETURNED #{@events.count} TWEETS"
# puts "RETURNED #{@events.inspect}"
