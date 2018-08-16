class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description
  has_many :contributors
end
