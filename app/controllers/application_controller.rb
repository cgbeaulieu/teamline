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
    @current_user ||= Person.find(session[:person_id]) if session[:person_id]
  end
  helper_method :current_user
end
