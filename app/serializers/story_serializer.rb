class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description
end
