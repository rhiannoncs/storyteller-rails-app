class Team < ApplicationRecord
	has_many :memberships
	has_many :users, through: :memberships
	has_many :stories

	validates :name, presence: true, uniqueness: true

	def public_stories
		stories.where(public: true)
	end
end
