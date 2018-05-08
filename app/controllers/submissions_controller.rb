class SubmissionsController < ApplicationController

	def index
		@story = Story.find(params[:story_id])
		@submissions = Submission.by_story_and_user(params[:story_id], session[:user_id])
	end

	def new
		@submission = Submission.new
		@story = Story.find(params[:story_id])
	end

	def create
		@story = Story.find(params[:story_id])
		@submission = @story.submissions.build(submission_params)
		if @submission.save
			redirect_to story_path(@story)
		else
			render :new
		end
	end

	def edit
		@story = Story.find(params[:story_id])
		@submission = Submission.find(params[:id])
	end

	def update
		@story = Story.find(params[:story_id])
		@submission = Submission.find(params[:id])
		@submission.update(submission_params)
		redirect_to story_path(@story)
	end



	private

	def submission_params
		params.require(:submission).permit(:content, :user_id)
	end

end