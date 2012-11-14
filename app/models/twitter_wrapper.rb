class TwitterWrapper
  def self.get_tweets(users_array)
    users_array.each do |user|
      timeline = Twitter.user_timeline(user)
      Tweet.update_from_timeline(timeline)
    end
  end
end
