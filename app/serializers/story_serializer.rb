class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description
  has_many :contributors
  has_many :submissions
end
