class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content
      t.date :published_at
      t.string :handle

      t.timestamps
    end
  end
end
