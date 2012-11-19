class GhEvent < ActiveRecord::Base
  attr_accessible :published_at, :category, :username, :content, :url, :person
  validates_uniqueness_of :published_at, :scope => :person_id
  validates :published_at, :presence => true
  validates :content, :uniqueness => true

  belongs_to :person

  def self.create_from_octokit_event(event)
    username = event.actor.login
    self.create(:published_at => event.created_at, :category => event.type, 
                :username => username, :content => event.content, :url => event.repo.url, 
                :person => Person.find_by_gh_username(username))
  end
end
