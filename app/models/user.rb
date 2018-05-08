class User < ApplicationRecord
	has_many :memberships
	has_many :teams, through: :memberships
	has_many :submissions
	has_many :stories, through: :submissions
	has_many :prompts
	
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	def unique_stories
		stories.uniq
	end

	def public_stories
		stories.public.uniq
	end
end
