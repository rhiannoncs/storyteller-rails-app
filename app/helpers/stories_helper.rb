module StoriesHelper

	def add_submission(story)
		if story.team_members.include?(current_user)
			link_to("Add to Story", new_story_submission_path(story))
		end
	end

	def edit_story(story)
		if story.team_members.include?(current_user)
			link_to("Edit Story Details", edit_story_path(story))
		end
	end

	def edit_submissions(story)
		if story.users.include?(current_user)
			link_to("Edit Your Contributions", story_submissions_path(story))
		end
	end

	def team_selector(story, f)
		if story.new_record?
			f.label :team
			f.collection_select(:team_id, current_user.teams, :id, :name, {:prompt => true})
		end
	end

	def story_status(story)
		if story.complete
			"Complete"
		else
			"In Progress"
		end
	end

end