class SetDefaultClassnameForTweets < ActiveRecord::Migration
  def change
    change_column :tweets, :classname, :string, :default => "tweet"
  end
end
