class ProfileController < ApplicationController
  skip_before_action :verify_user, only: [:new, :update]

  def new
    @user = User.new
    @team_names = Team.pluck(:name)
    @user_name = session[:user_name]
    puts @user_name
  end

  def show
    session_email = session[:user_email]

    @user = User.where(email: session_email).take
    if @user != nil
      @user_team = @user.team.name
      @user_name = @user.name
      @user_email = @user.email
    else
      @user = User.new
    end
  end

  def update
    session_email = session[:user_email]
    @user = User.where(email: session_email).take

    input = params[:user]
    input_name = input[:name]
    input_team = Team.where(name: input[:team]).take


    if @user != nil
      @user.update!(
        name: input_name,
        email: session_email,
        team: input_team
      )
      redirect_to action: "show", controller: "profile"
    else
      @user = User.create!(
        name: input_name,
        email: session_email,
        team: input_team
      )
      redirect_to action: "home", controller: "static_pages"
    end
  end

  def create
    input =  params[:user]
    team = Team.where(name: input[:team]).take
    @user = User.create!(
      name: input[:name],
      email: session[:email],
      team: team
    )

  end

end
