class SessionsController < ApplicationController
	skip_before_action :verify_user, only: [:create, :create_omniauth]

	#def new
	#end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to dashboard_path(@user)
		else
			flash[:error] = "Invalid email/password combination."
			redirect_to root_path
		end
	end

	def create_omniauth
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
			u.name = auth['info']['name']
			u.email = auth['info']['email']
			u.password = SecureRandom.hex
		end

		session[:user_id] = @user.id

		redirect_to dashboard_path(@user)
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end

	private

	def auth
		request.env['omniauth.auth']
	end

end