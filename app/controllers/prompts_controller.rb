class PromptsController < ApplicationController
	skip_before_action :verify_user, only: [:random]

	def index
		@prompts = Prompt.all.reverse
	end
	
	def new
		@prompt = Prompt.new
	end

	def create
		@prompt = current_user.prompts.build(prompt_params)
		if @prompt.save
			redirect_to prompts_path
		else
			render :new
		end
	end

	def random
		prompt = Prompt.order("RANDOM()").first
		render json: prompt
	end

	private

	def prompt_params
		params.require(:prompt).permit(:content)
	end

end