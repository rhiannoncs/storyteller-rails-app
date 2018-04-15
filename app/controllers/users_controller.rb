class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to dashboard_path(@user)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def dashboard
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end