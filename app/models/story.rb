class Story < ApplicationRecord
	belongs_to :team
	has_many :submissions
	has_many :users, through: :submissions

	validates :title, presence: true

	scope :dusty, -> { where(last_submission.updated_at < 2.days.ago) }

	def team_name
		team.name
	end

	def team_members
		team.users
	end

	def contributors
		users.uniq
	end

	def last_submission
		submissions.last
	end

	def self.public_and_alphabetical
		public.order(:title)
	end

end
