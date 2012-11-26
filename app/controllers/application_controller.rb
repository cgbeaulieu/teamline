class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= Person.find(session[:person_id]) if session[:person_id]
  end
  helper_method :current_user
end
