class StoriesController < ApplicationController

	def index
		@stories = Story.where(public: true)
	end

	def new
	end

	def create
	end

	def show
	end

end