class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :birthday, :image

  def image
    {image_url: self.object.image.blob.service_url}
  end

  has_many :blog_posts
  has_many :projects

end
