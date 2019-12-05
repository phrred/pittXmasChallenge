class ProfileController < ApplicationController
  skip_before_action :verify_user, only: [:new, :update]

  def new
    @comment = Comment.new
    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    @user = User.new
    @campus_names = ["CMU", "PITT"]
    @user_name = session[:user_name]
  end

  def show
    @comment = Comment.new
    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    session_email = session[:user_email]

    @user = User.where(email: session_email).take
    if @user != nil
      @user_campus = @user.campus
      @user_name = @user.name
      @user_email = @user.email
      @user_gender = if @user.gender then "Male" else "Female" end
      @campus_names = ["CMU", "PITT"]
      user_comments = Comment.where(:user => @user).all
      @user_points = 0
      @sg_points = 0
      @evangelism_points = 0
      @ser_points = 0
      @eq_points = 0
      @thanksgiving_points = 0
      user_comments.each do |comment|
        @user_points += comment.mission.points
        case comment.mission.category.mission_type
        when "Spiritual Growth"
          @sg_points += comment.mission.points
        when "Evangelism"
          @evangelism_points += comment.mission.points
        when "Service/Gratitude"
          @ser_points += comment.mission.points
        when "Equipping"
          @eq_points += comment.mission.points
        when "Thanksgiving Challenge"
          @thanksgiving_points += comment.mission.points
        end
        
      end
    else
      @user = User.new
    end
  end

  def update
    @comment = Comment.new
    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    session_email = session[:user_email]
    @user = User.where(email: session_email).take

    input = params[:user]
    input_name = input[:name]
    input_campus = input[:campus]
    input_gender = if input[:gender] == "Male" then true else false end
    is_staff = session_email.include?("gpmail") 

    if @user != nil
      @user.update!(
        name: input_name,
        email: session_email,
        campus: input_campus,
        gender: input_gender,
        staff: is_staff
      )
      redirect_to action: "show", controller: "profile"
    else
      @user = User.create!(
        name: input_name,
        email: session_email,
        campus: input_campus,
        gender: input_gender,
        staff: is_staff
      )
      redirect_to action: "home", controller: "static_pages"
    end
  end

  def create
    @comment = Comment.new
    @sg = Mission.where(:category_id => Category.where(:mission_type => "Spiritual Growth").first.id)
    @evangelism = Mission.where(:category_id => Category.where(:mission_type => "Evangelism").first.id)
    @ser = Mission.where(:category_id => Category.where(:mission_type => "Service/Gratitude").first.id)
    @eq = Mission.where(:category_id => Category.where(:mission_type => "Equipping").first.id)
    input =  params[:user]
    campus = input[:campus]
    user_gender = if input[:gender] == "Male" then true else false end
    is_staff = session[:user_email].include?("gpmail") 
    @user = User.create!(
      name: input[:name],
      email: session[:user_email],
      campus: input[:campus],
      gender: user_gender,
      staff: is_staff
    )

  end

end
