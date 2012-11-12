class GhEvent < ActiveRecord::Base
  attr_accessible :published_at, :category, :username, :content, :url

  belongs_to :person

  def self.create_from_octokit_event(event)
    self.create(:published_at => event.created_at, :category => event.type, 
                :username => event.actor.login, :content => event.content, :url => event.repo.url)
  end
end
