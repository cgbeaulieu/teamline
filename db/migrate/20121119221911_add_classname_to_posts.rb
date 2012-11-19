class AddClassnameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :classname, :string
  end
end
