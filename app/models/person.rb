class Person < ActiveRecord::Base
  attr_accessible :gh_username, :name, :rss_feed, :twitter_handle

  has_many :tweets
  has_many :posts
  has_many :gh_events
  belongs_to :team

  def self.all_feeds
    self.all.collect { |person| person.rss_feed }
  end

  def self.all_handles
    self.all.collect { |person| person.twitter_handle }
  end

  def self.all_gh_usernames
    self.all.collect { |person| person.gh_username }
  end
end
