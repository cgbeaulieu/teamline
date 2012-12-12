class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :teams_attributes

  has_many :teams
  accepts_nested_attributes_for :teams, allow_destroy: true

  validates_presence_of :email
  validates_uniqueness_of :email
end
