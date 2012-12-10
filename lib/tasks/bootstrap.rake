namespace :bootstrap do 
  desc 'Setting up teamline'
  task :setup => [:environment] do
  puts 'Welcome to Teamline, wait a moment while we get setup' 
    Rake::Task['bootstrap:bundle'].invoke()
    Rake::Task['db:reset'].invoke()
  end

  task :bundle => :environment do 
    `bundle install`
    puts "running bundle install"
  end
end