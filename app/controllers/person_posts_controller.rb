class PersonPostsController < ApplicationController

  def index
    @person = Person.find(params[:person_id])
    @posts = @person.posts

    render 'posts/index'
  end

end