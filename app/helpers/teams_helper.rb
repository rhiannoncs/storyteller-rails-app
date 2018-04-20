module TeamsHelper

	def join_team(team)
		if team.open
			render(partial: 'memberships/join', locals: {team: team})
		else
			content_tag(:h5, "This team is not currently accepting new members.")
		end
	end
end