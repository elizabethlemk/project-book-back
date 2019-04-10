class LinkSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :url

  belongs_to :project
end
