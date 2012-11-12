class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :published_at, :person
  
  belongs_to :person

  default_scope order('published_at DESC')

  def self.update_from_feed(feed)
    feed.entries.each do |entry|
      create_from_entry(entry) unless Post.find_by_url(entry.url)
    end
  end

  def self.create_from_entry(entry)
    create(:title => entry.title, :content => entry.content, 
           :url => entry.url, :published_at => entry.published, :person => Person.find_by_rss_feed(feed_url_from_entry_url(entry.url)))    
  end

private
  def self.domain_from_entry_url(entry_url)
    URI.parse(entry_url).hostname
  end

  def self.feed_url_from_entry_url(entry_url)
    "http://#{domain_from_entry_url(entry_url)}/atom.xml"
  end
end


