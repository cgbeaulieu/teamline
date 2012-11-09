task :fetchevents => :environment do
  OctokitWrapper.get_gh_events("davidbakertv")
  OctokitWrapper.get_gh_events("seldomatt")
  OctokitWrapper.get_gh_events("kcurtin")
  OctokitWrapper.get_gh_events("ejw1")
end
