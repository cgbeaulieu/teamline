class SessionsController < ApplicationController
  def create
    person = Person.from_omniauth(env["omniauth.auth"])
    session[:person_id] = person.id
    redirect_to edit_person_path(person.id), notice: "Signed in!"
  end

  def destroy
    session[:person_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
