class PersonGhEventsController < ApplicationController

  def index
    @person = Person.find(params[:person_id])
    @gh_events = Sorter.group_by_date(@person.gh_events)

    render 'gh_events/index'
  end

end
