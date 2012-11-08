class AddLinkToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :link, :string
  end
end
