class Tweet < ActiveRecord::Base
  attr_accessible :content, :handle, :published_at, :person
  validates_uniqueness_of :published_at, :scope => :person_id 
  belongs_to :person

  # default_scope order("published_at DESC")

  def self.update_from_timeline(timeline)
    timeline.each { |tweet| create_from_tweet(tweet) }
  end

  def self.create_from_tweet(tweet)
    content = linkup_mentions_and_hashtags(tweet.attrs[:text])
    handle  = tweet.attrs[:user][:screen_name]
    person = Person.find_by_twitter_handle(handle)
    person.update_attributes(:avatar_url => tweet.user.profile_image_url)
    person.tweets.create(:content => content, 
            :handle => handle,
            :published_at => tweet.attrs[:created_at])
  end

  private

  def self.linkup_mentions_and_hashtags(text)    
    text.gsub!(/@([\w]+)(\W)?/, '<a href="http://twitter.com/\1">@\1</a>\2')
    text.gsub!(/#([\w]+)(\W)?/, '<a href="http://twitter.com/search?q=%23\1">#\1</a>\2')
    text
  end
end
