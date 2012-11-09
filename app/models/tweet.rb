class Tweet < ActiveRecord::Base
  attr_accessible :content, :handle, :published_at

  default_scope order("published_at DESC")

  def self.update_from_timeline(timeline)
    timeline.each do |tweet|
      date = DateTime.parse(tweet.attrs[:created_at]) 
      create_from_tweet(tweet) unless self.find_by_published_at(date)
    end
  end

  def self.create_from_tweet(tweet)
    content = linkup_mentions_and_hashtags(tweet.attrs[:text])
    create(:content => content, 
            :handle => tweet.attrs[:user][:screen_name],
            :published_at => tweet.attrs[:created_at])
  end


  private

  def self.linkup_mentions_and_hashtags(text)    
    text.gsub!(/@([\w]+)(\W)?/, '<a href="http://twitter.com/\1">@\1</a>\2')
    text.gsub!(/#([\w]+)(\W)?/, '<a href="http://twitter.com/search?q=%23\1">#\1</a>\2')
    text
  end


end