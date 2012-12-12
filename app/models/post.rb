class Post < ActiveRecord::Base
  extend Teamable
  attr_accessible :content, :title, :url, :published_at, :person, :classname
  validates :content, :uniqueness => true
  validates :published_at, :presence => true
  belongs_to :person

  def self.update_from_feed(feed)
    begin
      person = Person.find_by_rss_feed(feed.feed_url)
      existing_posts = Post.where(:person_id => person.id).collect { |p| p.url }

      feed.entries.reject { |e| existing_posts.include?(e.url) }.each do |entry|
        create_from_entry(entry, person) 
      end
    rescue => e
      puts e.inspect
    end
  end

  def self.create_from_entry(entry, person)
    create(
      :title => entry.title, 
      :content => entry.content,
      :url => entry.url,
      :published_at => entry.published,
      :person => person
    )
  end
end

