class Team < ActiveRecord::Base
  attr_accessible :name, :website, :subdomain, :people_attributes
  has_many :people
  accepts_nested_attributes_for :people
end
