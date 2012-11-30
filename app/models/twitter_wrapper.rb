class TwitterWrapper
  def self.get_tweets(users_array)
    users_array.each do |user|
      puts user
      begin
        timeline = Twitter.user_timeline(user)
        Tweet.update_from_timeline(timeline)
      rescue => e
        puts e.inspect
      end
    end
  end
end
