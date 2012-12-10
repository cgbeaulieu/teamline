class Team < ActiveRecord::Base
  attr_accessible :name, :website, :subdomain
  has_many :people
end
