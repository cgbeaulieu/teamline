class AddUsernameToGhEvent < ActiveRecord::Migration
  def change
    add_column :gh_events, :username, :string
  end
end
