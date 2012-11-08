class RssParser

  def self.fetch_feeds(feed_urls)
    feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
    feeds.each_value { |feed| Post.create_from_feed(feed) }
  end

  def self.update_feeds(feeds)
    date = Post.last
    #start parsing the feed
    #when the date is equal to Post.last, stop parsing
  end
end