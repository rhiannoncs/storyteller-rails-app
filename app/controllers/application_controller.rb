class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :verify_user
	helper_method :current_user
	helper_method :authenticated_user?

	skip_before_action :verify_user, only: [:welcome]

	def welcome
		@recent = Submission.recent_stories
	end

	private

	def current_user
		User.find_by(id: session[:user_id])
	end

	def authenticated_user?
		!!current_user
	end

	def verify_user
		redirect_to root_path unless authenticated_user?
	end
end
