class StoriesController < ApplicationController
	skip_before_action :verify_user, only: [:index, :show]

	def index
		@stories = Story.public_and_alphabetical
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
		verify_team_member unless @story.public
	end

	def edit
		@story = Story.find(params[:id])
		verify_team_member
	end

	def update
		@story = Story.find(params[:id])
		@story.update(story_params)
		redirect_to story_path(@story)
	end
	
	def dusty
		@stories = Story.dusty_and_open
	end

	def silly
		@story = Story.find(params[:id])
	end 

	private
	
	def story_params
		params.require(:story).permit(:title, :genre, :team_id, :description, :public, :complete)
	end

	def verify_team_member
		redirect_to root_path unless @story.team_members.include?(current_user)
	end


end