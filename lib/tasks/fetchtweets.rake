task :fetch_tweets => :environment do 

  TwitterWrapper.get_tweets(["kcurtin", "seldomatt"])

end