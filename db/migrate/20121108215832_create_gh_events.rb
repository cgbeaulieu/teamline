class CreateGhEvents < ActiveRecord::Migration
  def change
    create_table :gh_events do |t|

      t.timestamps
    end
  end
end
