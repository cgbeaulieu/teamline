class AddColumnToGithub < ActiveRecord::Migration
  def change
    add_column :githubs, :person, :string
  end
end
