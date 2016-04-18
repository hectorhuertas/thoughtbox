class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize!

  def authorize!
    redirect_to login_path unless authorized?
  end

  def authorized?
    PermissionService.allow?(current_user, params[:controller], params[:action])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
