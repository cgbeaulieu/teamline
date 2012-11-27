# TODO: Should this be nested or namespaced?
# Could this be integrated into an existing
# controller action as it seems to be sharing a view
# with a different controller?
class PersonGhEventsController < ApplicationController

  def index
    @person = Person.find(params[:person_id])
    @gh_events = Sorter.group_by_date(@person.gh_events)

    render 'gh_events/index'
  end

end
