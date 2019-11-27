class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :verify_user

  def current_user
    @current_user ||= User.where(email: session[:user_email]).take if session[:user_email]
    @current_user
  end

  def verify_user
    if not current_user()
      redirect_to controller: 'login', action: 'show'
    end
  end
end
