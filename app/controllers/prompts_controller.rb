class PromptsController < ApplicationController

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

	private

	def prompt_params
		params.require(:prompt).permit(:content)
	end

end