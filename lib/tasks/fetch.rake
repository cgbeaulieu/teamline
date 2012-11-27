namespace :fetch do
  desc 'Fetch all content'
  task :all => [:environment] do
    Rake::Task['fetch:github'].invoke()
    Rake::Task['fetch:posts'].invoke()
    Rake::Task['fetch:tweets'].invoke()
  end

  task :github => :environment do
    puts "Fetching github"
    Person.all_gh_usernames.each do |user|
      OctokitWrapper.get_gh_events(user)
    end
  end

  task :posts => :environment do
    puts "Fetching posts"
    RssParser.update_feeds(Person.all_feeds.compact)
  end

  task :tweets => :environment do
    puts "Fetching tweets"
    TwitterWrapper.get_tweets(Person.all_handles)
  end
end
