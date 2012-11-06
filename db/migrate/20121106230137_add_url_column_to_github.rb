class AddUrlColumnToGithub < ActiveRecord::Migration
  def change
    add_column :githubs, :url, :string
  end
end
