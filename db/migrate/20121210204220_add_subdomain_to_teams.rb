class AddSubdomainToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :subdomain, :string
  end
end
