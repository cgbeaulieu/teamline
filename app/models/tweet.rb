class Tweet < ActiveRecord::Base
  attr_accessible :content, :handle, :published_at, :person, :link
  validates_uniqueness_of :published_at, :scope => :person_id
  validates :published_at, :presence => true
  validates :content, :uniqueness => true
  belongs_to :person

  def self.update_from_timeline(timeline)
    timeline.each { |tweet| create_from_tweet(tweet) }
  end

  def self.create_from_tweet(tweet)
    # TODO This can be refactored to a post hoc attributazation
    # like first create the instance
    # then call the methods
    # t = person.tweets.build
    # t.person = Person.find
    # like tweet.person = Person.find vs
    # person = Person.find
    # tweet.create(:person => person)
    content = linkup_mentions_and_hashtags(tweet.attrs[:text])
    handle  = tweet.attrs[:user][:screen_name]
    person = Person.find_by_twitter_handle(handle)
    person.update_attributes(:avatar_url => tweet.user.profile_image_url)
    twitter_user_id = tweet.attrs[:user][:id]
    tweet_status_id = tweet.attrs[:id]
    link = "http://twitter.com/#{twitter_user_id}/status/#{tweet_status_id}"
    person.tweets.create(:content => content,
                         :handle => handle,
                         :link => link,
                         :published_at => tweet.attrs[:created_at])
  end

  private

  # TODO: Not into this being here
  def self.linkup_mentions_and_hashtags(text)
    text.gsub!(/@([\w]+)(\W)?/, '<a href="http://twitter.com/\1">@\1</a>\2')
    text.gsub!(/#([\w]+)(\W)?/, '<a href="http://twitter.com/search?q=%23\1">#\1</a>\2')
    text
  end
end
