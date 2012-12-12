class Team < ActiveRecord::Base
  attr_accessible :name, :website, :subdomain, :user_id, :people_attributes
  has_many :people
  belongs_to :user
  accepts_nested_attributes_for :people, allow_destroy: true
end
