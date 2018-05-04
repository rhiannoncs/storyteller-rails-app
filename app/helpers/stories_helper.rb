module StoriesHelper

	def add_submission(story)
		if story.team_members.include?(current_user)
			link_to("Add to Story", new_story_submission_path(story))
		end
	end

	def edit_story(story)
		if story.team_members.include?(current_user)
			link_to("Edit Story", edit_story_path(story))
		end
	end

	def team_selector(story, f)
		if story.new_record?
			f.label :team
			f.collection_select(:team_id, Team.all, :id, :name, {:prompt => true})
		end
	end

end