class NoteSerializer < ActiveModel::Serializer
  attributes :id, :comment

  belongs_to :project
end
