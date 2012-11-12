task :fetchevents => :environment do
  Person.all_gh_usernames.each do |user|
  OctokitWrapper.get_gh_events(user)
end
end
