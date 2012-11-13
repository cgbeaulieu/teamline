class AddEventDateToGhEvents < ActiveRecord::Migration
  def change
    add_column :gh_events, :eventdate, :datetime
  end
end
