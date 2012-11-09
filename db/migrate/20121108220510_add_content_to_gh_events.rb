class AddContentToGhEvents < ActiveRecord::Migration
  def change
    add_column :gh_events, :content, :string
  end
end
