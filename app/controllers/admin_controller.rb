class AdminController < ApplicationController
  layout "admin"

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/admin/login' unless current_user
  end

end
