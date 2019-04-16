class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :images, :completed, :notes, :links, :colors, :user

  def user
    self.object.user.username
  end

  def colors
    self.object.colors.sort_by(&:id)
  end

  def images
    self.object.images.map { |image| { id: image.blob.id, img_url: image.blob.service_url} }
  end

  has_many :notes
  has_many :links
  has_many :colors
  belongs_to :user
end
