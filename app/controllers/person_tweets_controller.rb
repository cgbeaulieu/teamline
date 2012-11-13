class PersonTweetsController < ApplicationController

  def index
    @person = Person.find(params[:person_id])
    @tweets = Sorter.group_by_date(@person.tweets)

    render 'tweets/index'
  end

end
