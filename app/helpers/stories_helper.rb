module StoriesHelper

	def add_submission(story)
		if story.team_members.include?(current_user)
			link_to("Add to Story", new_story_submission_path(story.id))
		end
	end 

end