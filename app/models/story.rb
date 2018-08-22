class Story < ApplicationRecord
	belongs_to :team
	has_many :submissions
	has_many :users, through: :submissions

	validates :title, presence: true

	scope :in_progress, -> { where(complete: false)}

	scope :public_and_alphabetical, -> { where(public: true).order(:title)}

	scope :public_and_numerical, -> { where(public: true)}

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

	def random_submissions
		submissions
	end

	def next_public
		if Story.public_and_numerical.last == self
			return Story.public_and_numerical.first
		else
			story = Story.public_and_numerical.find_by "id > ?", self.id
			return story
		end
	end

	def self.dusty
		in_progress.select{ |story| story.submissions.older.include?(story.last_submission) }
	end

	def self.dusty_and_open
		dusty.select{ |story| story.team.open_membership || story.team_members.include?(current_user)}
	end

end
