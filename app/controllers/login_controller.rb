class LoginController < ApplicationController
  include AuthHelper
  skip_before_action :verify_user, only: [:show]

  def show
    @comment = Comment.new
    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    if session[:user_name] != nil
      redirect_to home_path
    end
    @microsoft_login_url = get_login_url
  end
end
