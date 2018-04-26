class SubmissionsController < ApplicationController

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

	private

	def submission_params
		params.require(:submission).permit(:content, :user_id)
	end

end