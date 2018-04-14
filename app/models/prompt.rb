class Prompt < ApplicationRecord
	belongs_to :user

	validates :content, presence: true, length: {maximum: 300, too_long: "%{count} characters is the maximum allowed"}
end
