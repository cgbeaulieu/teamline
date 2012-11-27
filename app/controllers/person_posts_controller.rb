# TODO: Should this be nested or namespaced?
# Could this be integrated into an existing
# controller action as it seems to be sharing a view
# with a different controller?

class PersonPostsController < ApplicationController

  def index
    @person = Person.find(params[:person_id])
    # TODO: Same efficiency comment, do you really
    # need to be loading all the person's posts?

    # PS: I just figured out what this is actually doing
    # and you might need to do those large queries but maybe
    # there's another way.
    @posts = Sorter.group_by_date(@person.posts)

    # TODO: Again maybe this goes in some other controller?
    # Sharing views isn't a problem but I think these
    # (person_gh_events and this, and person_tweets controllers)
    # have weird names that might be code smells, no?
    render 'posts/index'
  end

end
