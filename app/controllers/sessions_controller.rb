class SessionsController < ApplicationController
  def new  
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged In!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_ur, :notice => "Logged Out!"
  end

  #GITHUB AUTHENTICATION
  # def create
  #   person = Person.from_omniauth(env["omniauth.auth"])
  #   session[:person_id] = person.id
  #   redirect_to edit_person_path(person.id), notice: "Signed in!"
  # end

  # def destroy
  #   session[:person_id] = nil
  #   redirect_to root_url, notice: "Signed out!"
  # end
end
