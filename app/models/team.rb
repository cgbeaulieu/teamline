class Team < ActiveRecord::Base
  attr_accessible :name, :website
  has_many :people
end
