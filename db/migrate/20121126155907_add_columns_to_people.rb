class AddColumnsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :uid, :string
    add_column :people, :email, :string
    add_column :people, :provider, :string
  end
end
