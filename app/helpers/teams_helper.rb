module TeamsHelper

	def team_stories(team)
		if team.users.include?(current_user)
			stories = team.stories
		else
			stories = team.stories.where(public: true)
		end

		stories.each do |story|
			link_to story.title, story_path(story) + tag.br
		end
	end
end