class ApplicationController < ActionController::Base
  protect_from_forgery

  def teams_only
    redirect_to root_url(:subdomain => "www") unless current_team
  end

  def current_team
    @current_team ||= Team.find_by_subdomain(request.subdomain)
  end
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
