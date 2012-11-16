# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Person.delete_all

@kevin = Person.create(
  :gh_username => "kcurtin",
  :twitter_handle => "KCurtin",
  :name => "Kevin Curtin",
  :rss_feed => 'http://kcurtin.github.com/atom.xml'
)
puts "Created #{@kevin.name}"

@matt = Person.create(
  :gh_username => "seldomatt",
  :twitter_handle => "seldomatt",
  :name => "Matt",
  :rss_feed => 'http://blog.seldomatt.com/atom.xml'
)
puts "Created #{@matt.name}"

@david = Person.create(
  :gh_username => "davidbakertv",
  :twitter_handle => "davidbakertv",
  :name => "David",
  :rss_feed => 'http://dbtvblog.herokuapp.com/atom.xml'
)

puts "Created #{@david.name}"

@ericka = Person.create(
  :gh_username => "EJW1",
  :twitter_handle => "ErickaJoy_",
  :name => "Ericka",
  :rss_feed => 'http://erickaward.herokuapp.com/atom.xml'
)
puts "Created #{@ericka.name}"