class NoteSerializer < ActiveModel::Serializer
  attributes :id, :type_name, :comment

  belongs_to :project
end
