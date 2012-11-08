class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :created_at
  default_scope order('created_at DESC')

  def self.create_from_feed(feed)
    feed.entries.each do |entry|
      create(:title => entry.title, :content => entry.content, 
             :url => entry.url, :created_at => entry.published)    
    end
  end
end
