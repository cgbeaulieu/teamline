task :fetch_tweets => :environment do 

  TwitterWrapper.get_tweets(Person.all_handles)

end