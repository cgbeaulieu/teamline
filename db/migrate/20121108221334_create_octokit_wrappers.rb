class CreateOctokitWrappers < ActiveRecord::Migration
  def change
    create_table :octokit_wrappers do |t|

      t.timestamps
    end
  end
end
