class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :rss_feed
      t.string :twitter_handle
      t.string :gh_username

      t.timestamps
    end
  end
end
