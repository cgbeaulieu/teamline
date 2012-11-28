class ChangeContentToTextGhEvents < ActiveRecord::Migration
  def change
    change_column :gh_events, :content, :text
  end
end
