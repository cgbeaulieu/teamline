class AddPersonIdToGhEvent < ActiveRecord::Migration
  def change
    add_column :gh_events, :person_id, :integer
  end
end
