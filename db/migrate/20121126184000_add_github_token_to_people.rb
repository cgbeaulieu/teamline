class AddGithubTokenToPeople < ActiveRecord::Migration
  def change
    add_column :people, :github_token, :string
  end
end
