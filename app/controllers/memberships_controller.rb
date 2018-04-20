class MembershipsController < ApplicationController

	def create
		team = Team.find(params[:membership][:team_id])
		membership = Membership.new(membership_params)
		if membership.save
			flash[:joined] = "You have joined this team."
			redirect_to team_path(team)
		else
			flash[:error] = "This request could not be processed."
			redirect_to team_path(team)
		end
	end

	private

	def membership_params
		params.require(:membership).permit(:team_id, :user_id)
	end

end