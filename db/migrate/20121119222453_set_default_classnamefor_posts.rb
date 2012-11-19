class SetDefaultClassnameforPosts < ActiveRecord::Migration
  def change
    change_column :posts, :classname, :string, :default => "post"
  end
end
