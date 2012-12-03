class GithubEvent
  attr_accessor :headline, :content, :url, :event, :created_at, :username, :category

  VALID_EVENTS = ["PushEvent",
    "GistEvent",
    "PullRequestEvent",
    "CreateEvent"
  ]

  def initialize(event)
    @event = event
    @created_at = event.created_at
    @username = event.actor.login
    @category = self.class.to_s
  end

  def create_gh_event
    GhEvent.create_from_github_event(self)
  end

  def url
    @url ||= "http://www.github.com/#{event.actor.login}/#{event.repo.name}"
  end

  def person
    @person ||= Person.find_or_create_by_gh_username(event.actor.login)
  end
end

class PushEvent < GithubEvent
  def content
    @content ||= event.payload.commits.last.message
  end

  def headline
    @headline ||= "#{event.actor.login} pushed to #{event.repo.name}"
  end
end

class CreateEvent < GithubEvent
  def headline
    @headline ||= "#{event.actor.login} created #{event.repo.name}"
  end

  def content
    @content ||= event.payload.description
  end
end

class GistEvent < GithubEvent
  def headline
    @headline ||= "#{event.actor.login} created a new gist"
  end

  def content
    @content ||= event.payload.gist.description
  end

  def url
    @url ||= event.payload.gist.html_url
  end

end

class PullRequestEvent < GithubEvent
  def headline
    @headline ||= "#{event.actor.login} #{event.payload.action} a Pull Request for #{event.repo.name}"
  end

  def content
    @content ||= event.payload.pull_request.title
  end

  def url
    @url ||= event.payload.pull_request.diff_url
  end
end