# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# @user = Person.create(
#   :gh_username => "user_gh_username",
#   :twitter_handle => "user_twitter_handle" NOTE: do not include the @ symbol in your twitter handle,
#   :name => "First Last",
#   :rss_feed => 'user_rss_feed'
# )
# puts "Created #{@user.name}"

#repeat the above block for all users you would like to seed 

@user = Person.create(
  :gh_username => "kcurtin",
  :twitter_handle => "KCurtin",
  :name => "Kevin Curtin",
  :rss_feed => 'kcurtin.github.com/atom.xml'
)
puts "Created #{@user.name}"