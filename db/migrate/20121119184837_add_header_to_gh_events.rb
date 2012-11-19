class AddHeaderToGhEvents < ActiveRecord::Migration
  def change
    add_column :gh_events, :headline, :string
  end
end
