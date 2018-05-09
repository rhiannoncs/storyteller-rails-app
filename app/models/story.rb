class Story < ApplicationRecord
	belongs_to :team
	has_many :submissions
	has_many :users, through: :submissions

	validates :title, presence: true

	def team_name
		team.name
	end

	def team_members
		team.users
	end

	def contributors
		users.uniq
	end

	def self.public_and_alphabetical
		public.order(:title)
	end

end
