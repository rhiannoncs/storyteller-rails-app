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

	def create_omniauth
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
			u.name = auth['info']['name']
			u.email = auth['info']['email']
		end

		session[:user_id] = @user.id

		redirect_to dashboard_path(@user)
	end

	def destroy
		session.delete :user_id
		redirect_to login_path
	end

	private

	def auth
		request.env['omniauth.auth']
	end

end