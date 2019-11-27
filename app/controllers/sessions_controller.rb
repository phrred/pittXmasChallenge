class SessionsController < ApplicationController
  skip_before_action :verify_user
  def googleAuth
    auth_hash = request.env['omniauth.auth']
    user = User.where(email: auth_hash.info.email).take

    if user
      session[:user_email] = user.email
      session[:user_name] = user.name
      redirect_to action: "home", controller: "static_pages"
    else
      session[:user_email] = auth_hash.info.email
      session[:user_name] = auth_hash.info.name
      redirect_to action: "new", controller: "profile"
    end

  end

  def destroy
    session[:user_email] = nil
    session[:user_name] = nil
    redirect_to root_path
  end
end
