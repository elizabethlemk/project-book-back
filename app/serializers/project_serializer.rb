class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :images, :completed, :notes, :links, :colors, :user

  def user
    self.object.user.username
  end

  def images
    {
      image_urls: self.object.images.map { |image| image.blob.service_url }
    }
  end

  has_many :notes
  has_many :links
  has_many :colors
  belongs_to :user
end
