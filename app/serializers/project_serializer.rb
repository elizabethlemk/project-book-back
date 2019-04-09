class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :color, :images, :completed

  has_many :notes
  has_many :links
end
