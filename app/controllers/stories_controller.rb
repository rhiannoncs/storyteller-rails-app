class StoriesController < ApplicationController
	skip_before_action :verify_user, only: [:index, :show]

	def index
		@stories = Story.where(public: true)
	end

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(story_params)
		if @story.save
			redirect_to story_path(@story)
		else
			render :new
		end
	end

	def show
		@story = Story.find(params[:id])
		redirect_to root_path unless @story.team_members.include?(current_user) | @story.public
	end

	private
	
	def story_params
		params.require(:story).permit(:title, :genre, :team_id, :description, :public)
	end


end