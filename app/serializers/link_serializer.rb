class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url

  belongs_to :project
end
