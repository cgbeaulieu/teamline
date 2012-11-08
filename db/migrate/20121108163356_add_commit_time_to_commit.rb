class AddCommitTimeToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :commit_time, :string
  end
end
