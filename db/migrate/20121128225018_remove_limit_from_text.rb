class RemoveLimitFromText < ActiveRecord::Migration
  def change
    change_column :gh_events, :content, :text, :limit => nil
  end
end
