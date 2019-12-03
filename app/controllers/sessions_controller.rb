class SessionsController < ApplicationController
  include AuthHelper
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

  def microsoftAuth
    token = get_token_from_code params[:code]
    callback = Proc.new { |r| r.headers["Authorization"] = "Bearer #{token.token}" }

    graph = MicrosoftGraph.new(base_url: 'https://graph.microsoft.com/v1.0',
                                 cached_metadata_file: File.join(MicrosoftGraph::CACHED_METADATA_DIRECTORY, 'metadata_v1.0.xml'),
                                 &callback)
    email = graph.me.mail
    name = graph.me.display_name
    user = User.where(email: email).take
    if user
      session[:user_email] = user.email
      session[:user_name] = user.name
      redirect_to action: "home", controller: "static_pages"
    else
      session[:user_email] = email
      session[:user_name] = name
      redirect_to action: "new", controller: "profile"
    end
  end

  def destroy
    session[:user_email] = nil
    session[:user_name] = nil
    redirect_to root_path
  end
end
