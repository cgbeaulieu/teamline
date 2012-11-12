class Post < ActiveRecord::Base
  attr_accessible :content, :title, :url, :published_at
  
  belongs_to :person

  default_scope order('published_at DESC')

  def self.update_from_feed(feed)
    feed.entries.each do |entry|
      create_from_entry(entry) unless Post.find_by_url(entry.url)
    end
  end

  def self.create_from_entry(entry)
    create(:title => entry.title, :content => entry.content, 
           :url => entry.url, :published_at => entry.published)    
  end
end


