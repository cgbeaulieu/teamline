class RssParser
  def self.update_feeds(feed_urls)
    begin
      feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
      feeds.each_value { |feed| Post.update_from_feed(feed) }
    rescue => e
      puts e.inspect
    end
  end 
end
