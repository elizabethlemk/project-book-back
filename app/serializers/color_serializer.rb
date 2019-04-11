class ColorSerializer < ActiveModel::Serializer
  attributes :id, :color_hex

  belongs_to :project
end
