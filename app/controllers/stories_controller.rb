class StoriesController < ApplicationController

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
	end

	private
	
	def story_params
		params.require(:story).permit(:title, :genre, :team_id, :description, :public)
	end


end