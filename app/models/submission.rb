class Submission < ApplicationRecord
	belongs_to :story
	belongs_to :user

	validates :content, presence: true, length: {maximum: 2000, too_long: "%{count} characters is the maximum allowed"}

	def self.recent_stories
		last(5).collect{|submission| submission.story}.uniq
	end
end
