class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_page_id

  def set_page_id
    @page_id = 'id=' + params[:controller] + '' unless params[:controller].empty?
  end
end
