class Team < ApplicationRecord
	has_many :memberships
	has_many :users, through: :memberships
	has_many :stories

	validates :name, presence: true, uniqueness: true

	scope :open_membership, -> { where(open_membership: true).order(:name)}

	def public_stories
		stories.public_and_alphabetical
	end

end
