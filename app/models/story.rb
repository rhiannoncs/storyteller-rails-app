class Story < ApplicationRecord
	belongs_to :team
	has_many :submissions
	has_many :users, through: :submissions

	validates :title, presence: true

	scope :in_progress, -> { where(complete: false)}

	scope :public_and_alphabetical, -> { where(public: true).order(:title)}

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

	def self.dusty
		in_progress.select{ |story| story.submissions.older.include?(story.last_submission) }
	end

end
