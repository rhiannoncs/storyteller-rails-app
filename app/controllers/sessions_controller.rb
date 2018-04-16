class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to dashboard_path(@user)
		else
			flash[:error] = "Invalid email/password combination."
			render :new
		end
	end

	def destroy
		session.delete :user_id
		redirect_to login_path
	end

end