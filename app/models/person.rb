class Person < ActiveRecord::Base
  attr_accessible :gh_username, :name, :rss_feed, :twitter_handle, :avatar_url, :team_id

  validates_presence_of :name
  
  has_many :tweets
  has_many :posts
  has_many :gh_events
  belongs_to :team

  def self.from_omniauth(auth)
    # TODO: Use limit with first, limit(1)
    where(auth.slice("provider", "uid")).limit(1).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |person|
      person.provider = auth["provider"]
      person.uid = auth["uid"]
      person.gh_username = auth["info"]["nickname"]
      person.email = auth["info"]["email"]
    end
  end

  def self.all_feeds
    select("rss_feed").all.collect(&:rss_feed)
  end

  def self.all_handles
    # TODO: Ibid.
    self.all.collect { |person| person.twitter_handle }
  end

  def self.all_gh_usernames
    # TODO: Sameseez
    self.all.collect { |person| person.gh_username }
  end
end
