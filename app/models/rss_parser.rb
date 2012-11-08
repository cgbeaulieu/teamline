class RssParser

  def self.posts_from_feed(feedurl)
    feed = Feedzirra::Feed.fetch_and_parse(feedurl)
    feed.entries.each{|entry| Post.create(:title => entry.title, :content => entry.content, :url => entry.url, :created_at => entry.published)}
  end

end