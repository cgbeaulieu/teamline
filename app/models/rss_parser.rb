class RssParser
  def self.update_feeds(feed_urls)
    feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
    feeds.each_value { |feed| Post.update_from_feed(feed) }
  end 
end
