class AddContentToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :content, :string
  end
end
