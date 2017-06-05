class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)

    request.env['omniauth.origin'] || stored_location_for(resource) || '/inicial/index'
  end
  
  def current_user
    @current_user = "errado"
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def authorize
    redirect_to '/users/sign_in' unless current_user
  end
end
