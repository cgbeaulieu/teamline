namespace :bootstrap do 
  desc 'Setting up teamline'
  task :setup do
  puts 'Welcome to Teamline, wait a moment while we get setup' 
  puts 'First, installing bundler gem'
    bundleroutput = `gem install bundler`
  puts bundleroutput
  puts 'Running bundle install to make sure you have all gems and dependencies for Teamline...'
    bundle = `bundle install`
  puts bundle
    `cp config/database.example.yml config/database.yml`
  puts "To continue setup, update your config/database.yml file with your local username, and type 'continue'"
  input = STDIN.gets.chomp.downcase
    if input == 'continue'
      puts "creating and migrating the database"
      Rake::Task['db:create'].invoke()
      Rake::Task['db:migrate'].invoke()
    end
  puts "To create a few team members, update your db/seeds.rb file, and type 'continue'"
  input = STDIN.gets.chomp.downcase
    if input == 'continue'
      puts 'seeding team members'
      Rake::Task['db:seed'].invoke()
    end
    `cp config/api_keys.example.yml config/api_keys.yml`
  puts "To fetch content, update the config/api_keys.yml file with your API keys/secrets, and type 'continue'"
  input = STDIN.gets.chomp.downcase
    if input == 'continue'
      Rake::Task['fetch:all'].invoke()
    end
  puts "you're now ready to boot up your server and start using teamline!"
  end
end