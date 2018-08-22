class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description, :team, :next_public
  has_many :contributors
  has_many :submissions
end
