class Submission < ApplicationRecord
	belongs_to :story
	belongs_to :user

	validates :content, presence: true, length: {maximum: 2000, too_long: "%{count} characters is the maximum allowed"}

	scope :older, -> { where("updated_at < ?", 2.days.ago) }

	def self.recent_stories
		last(5).collect{|submission| submission.story}.uniq.reverse
	end

	def self.by_story_and_user(story_id, user_id)
		where(story_id: story_id, user_id: user_id)
	end
end
