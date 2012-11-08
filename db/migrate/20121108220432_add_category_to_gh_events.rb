class AddCategoryToGhEvents < ActiveRecord::Migration
  def change
    add_column :gh_events, :category, :string
  end
end
