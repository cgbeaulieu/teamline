class ChangePublishedAtToDate < ActiveRecord::Migration
	def change
		change_column :gh_events, :published_at, :date
	end
end
