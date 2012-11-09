class GhEvent < ActiveRecord::Base
  attr_accessible :eventdate, :category, :username

  def self.create_from_octokit_event(event)
    self.create(:eventdate => event.created_at, :category => event.type, :username => event.actor.login)
  end

end
