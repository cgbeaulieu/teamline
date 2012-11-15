class ChangePublishedAtToDateTimeTweet < ActiveRecord::Migration
  def change
    change_column :tweets, :published_at, :datetime
  end
end
