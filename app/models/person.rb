class Person < ActiveRecord::Base
  attr_accessible :gh_username, :name, :rss_feed, :twitter_handle

  has_many :tweets
  has_many :posts
  has_many :gh_events

  def self.all_feeds
    self.all.collect { |person| person.rss_feed }
  end
end