class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

  def require_login
    return if session[:user_id]

    flash[:error] = 'You must be logged in to access this section'
    redirect_to sign_in_path # halts request cycle
  end
end
