class NoteSerializer < ActiveModel::Serializer
  attributes :id, :comment, :idx

  belongs_to :project
end
