class AddUsernameToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :username, :string
  end
end
