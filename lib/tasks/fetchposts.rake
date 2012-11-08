task :fetchpost => :environment do 

  RssParser.posts_from_feed("http://blog.seldomatt.com/atom.xml")

end