class DropTable2 < ActiveRecord::Migration
  def up
  	drop_table :githubs
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
