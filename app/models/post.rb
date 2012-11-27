class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :published_at, :person, :classname
  validates :content, :uniqueness => true
  validates :published_at, :presence => true
  belongs_to :person

  def self.update_from_feed(feed)
    begin
      feed_url = feed.feed_url
      # find all urls
      # load all posts with that url
      # check that array

      existing_posts = Post.where(:url => entry.url).collect{|p| p.url}
      # TODO: Is it possible to consolidate the Post.find_by_url
      # and avoid the n+1?
      feed.entries.reject{|e| existing_posts.include?(e) } each do |entry|
        create_from_entry(entry, feed_url) 
      end
    rescue => e
      puts "Error parsing feed"
    end
  end

  def self.create_from_entry(entry, feed_url)
    # TODO: Make this pretty.
    create(:title => entry.title, :content => entry.content,
           :url => entry.url, :published_at => entry.published,
           :person => Person.find_by_rss_feed(feed_url))
  end
end

