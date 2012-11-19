class AddClassnameToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :classname, :string
  end
end
