class DropTableOcktokitWrappers < ActiveRecord::Migration
  def change 
    drop_table :octokit_wrappers
  end
end
