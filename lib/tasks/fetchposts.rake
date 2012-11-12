task :fetch_posts => :environment do 

  RssParser.update_feeds(Person.all_feeds)

end