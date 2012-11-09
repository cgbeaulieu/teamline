task :fetchevents => :environment do
  OctokitWrapper.get_gh_events("davidbakertv")
end
