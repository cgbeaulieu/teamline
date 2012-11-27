class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :published_at, :person, :classname
  validates :content, :uniqueness => true
  validates :published_at, :presence => true
  belongs_to :person

  def self.update_from_feed(feed)
    begin
      #all of the posts
      feed_url = feed.url
      # existing_posts = Post.where(:url => entry.url).collect { |p| p.url }
      urls = feed.entries.map { |e| e.url  }

      feed.entries.reject { |e| existing_posts.include?(e) }.each do |entry|
        create_from_entry(entry, feed_url) 
      end
    rescue => e
      puts e.inspect
    end
  end

  def self.create_from_entry(entry, feed_url)
    create(
      :title => entry.title, 
      :content => entry.content,
      :url => entry.url,
      :published_at => entry.published,
      :person => Person.find_by_rss_feed(feed_url)
    )
  end
end

