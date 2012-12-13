namespace :team do
  desc 'assign team'
  task :assign => [:environment] do 
    puts "Combine team members into subdomain"
    flatiron = Team.create(:name => 'flatiron',
                          :website => 'flatironschool.com',
                          :subdomain => 'flatiron')
    Person.all.each do |person|
      person.team = flatiron
      person.save
    end
  end
end