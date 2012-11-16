class AddAvatarUrlToPeople < ActiveRecord::Migration
  def change
    add_column :people, :avatar_url, :string
  end
end
