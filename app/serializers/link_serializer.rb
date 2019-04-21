class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :idx

  belongs_to :project
end
