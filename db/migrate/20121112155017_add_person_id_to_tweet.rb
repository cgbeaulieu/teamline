class AddPersonIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :person_id, :integer
  end
end
