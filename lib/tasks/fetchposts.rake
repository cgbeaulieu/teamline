task :fetch_posts => :environment do 

  RssParser.fetch_feeds(["http://blog.seldomatt.com/atom.xml", "http://kcurtin.github.com/atom.xml"])

end