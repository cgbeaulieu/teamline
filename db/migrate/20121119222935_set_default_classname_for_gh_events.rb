class SetDefaultClassnameForGhEvents < ActiveRecord::Migration
  def change
    change_column :gh_events, :classname, :string, :default => "ghevent"
  end
end
