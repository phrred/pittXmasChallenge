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
    @user_staff = @user.staff
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
      @user_staff = @user.staff
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
    input_staff = input[:staff]


    if @user != nil
      @user.update!(
        name: input_name,
        email: session_email,
        campus: input_campus,
        gender: input_gender,
        staff: input_staff
      )
      redirect_to action: "show", controller: "profile"
    else
      @user = User.create!(
        name: input_name,
        email: session_email,
        campus: input_campus,
        gender: input_gender,
        staff: input_staff
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
    @user = User.create!(
      name: input[:name],
      email: session[:email],
      campus: input[:campus],
      gender: user_gender,
      staff: input[:staff]
    )

  end

end
