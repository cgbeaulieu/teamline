task :fetch_tweets => :environment do 

  TwitterWrapper.get_tweets(["kcurtin", "seldomatt", "davidbakertv", "ErickaJoy_"])

end