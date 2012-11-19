class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :published_at, :person, :classname
  validates :content, :uniqueness => true  
  validates :published_at, :presence => true
  belongs_to :person

  def self.update_from_feed(feed)
    begin
      feed_url = feed.feed_url
      feed.entries.each do |entry|
        create_from_entry(entry, feed_url) unless Post.find_by_url(entry.url)
      end
    rescue => e
      puts "Error parsing feed"
    end
  end

  def self.create_from_entry(entry, feed_url)
    create(:title => entry.title, :content => entry.content, 
           :url => entry.url, :published_at => entry.published, 
           :person => Person.find_by_rss_feed(feed_url))    
  end
end

