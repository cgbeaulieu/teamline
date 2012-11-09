task :fetch_posts => :environment do 

  RssParser.update_feeds(["http://blog.seldomatt.com/atom.xml", "http://kcurtin.github.com/atom.xml", "http://dbtvblog.herokuapp.com/atom.xml" ,"http://erickaward.herokuapp.com/atom.xml"])

end