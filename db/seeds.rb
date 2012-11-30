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
  :name => "Matt Salerno",
  :rss_feed => 'http://blog.seldomatt.com/atom.xml'
)
puts "Created #{@matt.name}"

@david = Person.create(
  :gh_username => "davidbakertv",
  :twitter_handle => "davidbakertv",
  :name => "David Baker",
  :rss_feed => 'http://dbtvblog.herokuapp.com/atom.xml'
)

puts "Created #{@david.name}"

@ericka = Person.create(
  :gh_username => "EJW1",
  :twitter_handle => "ErickaJoy_",
  :name => "Ericka Ward",
  :rss_feed => 'http://erickaward.herokuapp.com/atom.xml'
)
puts "Created #{@ericka.name}"

@corinna = Person.create(
  :gh_username => "cjbrock",
  :twitter_handle => "cjnboston",
  :name => "Corinna Brock",
  :rss_feed => 'http://cjbrock.github.com/atom.xml'
)
puts "Created #{@corinna.name}"

@stephen = Person.create(
  :gh_username => "stephenchen13",
  :twitter_handle => "twenty2twoss",
  :name => "Stephen Chen",
  :rss_feed => 'http://newcodeflow.herokuapp.com/atom.xml'
)
puts "Created #{@stephen.name}"

@joseph = Person.create(
  :gh_username => "jvenator",
  :twitter_handle => "j_venator",
  :name => "Joseph DeVenuta",
  :rss_feed => 'http://j.venator.vc/feed/'
)
puts "Created #{@joseph.name}"

@rex = Person.create(
  :gh_username => "xta",
  :twitter_handle => "rexfeng",
  :name => "Rex Feng",
  :rss_feed => 'http://www.rexfeng.com/blog/feed/'
)
puts "Created #{@rex.name}"

@adam = Person.create(
  :gh_username => "ajonas04",
  :twitter_handle => "adamcjonas",
  :name => "Adam Jonas",
  :rss_feed => 'http://www.adamjonas.com/atom.xml'
)
puts "Created #{@adam.name}"

@akiva = Person.create(
  :gh_username => "akeyva",
  :twitter_handle => "akeyva",
  :name => "Akiva Leeder",
  :rss_feed => 'http://akivaleeder.herokuapp.com/atom.xml'
)
puts "Created #{@akiva.name}"

@kevin_mcnamee = Person.create(
  :gh_username => "kevinmcnamee",
  :twitter_handle => "mcnameekm",
  :name => "Kevin McNamee",
  :rss_feed => 'http://kevmcnamee.com/atom.xml'
)
puts "Created #{@kevin_mcnamee.name}"

@jack = Person.create(
  :gh_username => "JackNolan",
  :twitter_handle => "JackPNolan",
  :name => "Jack Nolan",
  :rss_feed => 'http://jacknolan.herokuapp.com/atom.xml'
)
puts "Created #{@jack.name}"

@li = Person.create(
  :gh_username => "styliii",
  :twitter_handle => "styliii",
  :name => "Li Ouyang",
  :rss_feed => 'http://styliii.com/atom.xml'
)
puts "Created #{@li.name}"

@josh = Person.create(
  :gh_username => "joshrowley",
  :twitter_handle => "joshrowley",
  :name => "Josh Rowley",
  :rss_feed => 'http://jrowdev.com/atom.xml'
)
puts "Created #{@josh.name}"

@aaron = Person.create(
  :gh_username => "ams340",
  :twitter_handle => "ams340",
  :name => "Aaron Streiter",
  :rss_feed => 'http://evening-thicket-7319.herokuapp.com/atom.xml'
)
puts "Created #{@aaron.name}"

@nikhil = Person.create(
  :gh_username => "nt591",
  :twitter_handle => "NikhilThomas90",
  :name => "Nikhil Thomas",
  :rss_feed => 'http://nikhils-thoughts.herokuapp.com/atom.xml'
)
puts "Created #{@nikhil.name}"

@james = Person.create(
  :gh_username => "jvans1",
  :twitter_handle => "Jvans1",
  :name => "James Vanneman",
  :rss_feed => 'http://jvans1.github.com/atom.xml'
)
puts "Created #{@james.name}"

@brad = Person.create(
  :gh_username => "BradWheel",
  :twitter_handle => "Brad_Wheel",
  :name => "Brad Wheel",
  :rss_feed => 'http://bwheel.herokuapp.com/atom.xml'
)
puts "Created #{@brad.name}"

@jenya = Person.create(
  :gh_username => "innatewonderer",
  :twitter_handle => "jzueva",
  :name => "Jenya Zueva",
  :rss_feed => 'http://innatewonderer.github.com/atom.xml'
)
puts "Created #{@jenya.name}"