class AddUrlToGhevents < ActiveRecord::Migration
  def change
    add_column :gh_events, :url, :string
  end
end
