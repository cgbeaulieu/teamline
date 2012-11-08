class RssParser
  def self.posts_from_feed(feed)
    feed.entries.each{|entry| Post.create(:title => entry.title, :content => entry.content, :url => entry.url, :created_at => entry.published)}
  end

  def self.fetch_feeds(*feed_urls)
    feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
    feeds.each_value { |value| self.posts_from_feed(value) }
  end

  def self.update_feeds(feeds)
    date = Post.last
    #start parsing the feed
    #when the date is equal to Post.last, stop parsing
  end
end