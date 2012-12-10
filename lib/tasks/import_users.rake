namespace :users do 
  desc 'seeds flatiron school users' 
  task :import => [:environment] do 
    `ruby db/import_people.rb`
  end
end