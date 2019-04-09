class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :color, :images, :completed

  def images
    {
      image_urls: self.object.images.map { |image| image.blob.service_url }
    }
  end

  has_many :notes
  has_many :links
end
