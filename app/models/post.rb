class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :published_at
  default_scope order('published_at DESC')

  def self.create_from_feed(feed)
    feed.entries.each do |entry|
      create(:title => entry.title, :content => entry.content, 
             :url => entry.url, :published_at => entry.published)    
    end
  end
end
