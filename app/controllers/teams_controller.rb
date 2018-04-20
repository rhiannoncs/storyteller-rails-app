class TeamsController < ApplicationController

	def index
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		if @team.save
			@team.users << current_user
			redirect_to team_path(@team)
		else
			render :new
		end
	end

	def show
		@team = Team.find(params[:id])
		if @team.users.include?(current_user)
			@stories = @team.stories
		else
			@stories = @team.public_stories
		end
		@membership = Membership.new
	end


	private

	def team_params
		params.require(:team).permit(:name, :open)
	end

end