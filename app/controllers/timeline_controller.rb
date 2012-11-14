class TimelineController < ApplicationController
	def index
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    @events = Sorter.group_by_date(all_events)
	end

  def poll
    if params[:created_at]
      gh_events = GhEvent.where('created_at > ?', params[:created_at])
      posts = Post.where('created_at > ?', params[:created_at])
      tweets = Tweet.where('created_at > ?', params[:created_at])
      new_events = [tweets, posts, gh_events].flatten
    else
      new_events = [Tweet.all,Post.all,GhEvent.all].flatten
    end
    @events = Sorter.group_by_date(new_events)
    # @events = new_events.sort_by { |event| event.created_at }
    render :json => @events
  end
end