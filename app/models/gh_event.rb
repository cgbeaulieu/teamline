class GhEvent < ActiveRecord::Base
  extend Teamable
  attr_accessible :published_at, :category, :username, :content, :url, :person, :headline, :classname
  validates_uniqueness_of :published_at, :scope => :person_id
  validates :published_at, :presence => true
  validates :content, :uniqueness => true

  belongs_to :person

  # scope :team, lambda { |team_id|  }

  def self.create_from_octokit_event(event)
    # TODO: Long constructions can look prettier
    create(:published_at => event.created_at, :category => event.type,
           :username => event.actor.login, :content => event.content, :url => event.url,
           :headline => event.headline, :person => Person.find_by_gh_username(event.actor.login))
  end

  def self.create_from_github_event(event)
    create(
      :published_at => event.created_at,
      :category => event.category,
      :username => event.username,
      :content => event.content,
      :url => event.url,
      :headline => event.headline,
      :person => event.person
    )
  end

end
