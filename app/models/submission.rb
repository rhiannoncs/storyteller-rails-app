class Submission < ApplicationRecord
	belongs_to :story
	belongs_to :user

	validates :content, presence: true, length: {maximum: 2000, too_long: "%{count} characters is the maximum allowed"}
end
