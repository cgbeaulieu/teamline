class TimelineController < ApplicationController
	def index
    all_events = [GhEvent.all, Post.all, Tweet.all].flatten
    @events = Sorter.sort_by_published_at(all_events).paginate(:page => params[:page], :per_page => 20)
  end

  def poll
    if params[:created_at]
      query_date = DateTime.parse(params[:created_at])+2.seconds
      
      gh_events = GhEvent.where('created_at > ?', query_date)
      posts = Post.where('created_at > ?', query_date)
      tweets = Tweet.where('created_at > ?', query_date)

      new_events = [tweets, posts, gh_events].flatten
      
      @events = Sorter.sort_by_created_at(new_events)
      render :json => @events
    end
  end
end