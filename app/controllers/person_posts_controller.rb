class PersonPostsController < ApplicationController

  def index
    @person = Person.find(params[:person_id])
    @posts = Sorter.group_by_date(@person.posts)

    render 'posts/index'
  end

end