class LoginController < ApplicationController
	skip_before_action :verify_user, only: [:show]
	def show
		if session[:user_id] != nil
			redirect_to home_path
		end
	end
end
