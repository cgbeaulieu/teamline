class RenameEventdateInGhEvents < ActiveRecord::Migration
	def change
		rename_column :gh_events, :eventdate, :published_at		
	end	
end
