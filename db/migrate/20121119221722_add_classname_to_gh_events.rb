class AddClassnameToGhEvents < ActiveRecord::Migration
  def change
    add_column :gh_events, :classname, :string
  end
end
