namespace :bootstrap do 
  desc 'Setting up teamline'
  task :setup do
  puts 'Welcome to Teamline, wait a moment while we get setup' 
    `bundle install`
    `cp config/database.example.yml config/database.yml`
    Rake::Task['db:create'].invoke()
    `cp config/api_keys.example.yml config/api_keys.yml`
  end
end