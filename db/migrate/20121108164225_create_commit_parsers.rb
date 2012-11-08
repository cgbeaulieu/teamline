class CreateCommitParsers < ActiveRecord::Migration
  def change
    create_table :commit_parsers do |t|

      t.timestamps
    end
  end
end
