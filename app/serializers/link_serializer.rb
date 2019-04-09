class LinkSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :url
end
