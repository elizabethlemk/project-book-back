class BlogPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :updated_at, :user

  def created_at
    self.object.created_at.localtime.strftime("%m/%d/%Y at %I:%M%p %Z")
  end

  def updated_at
    self.object.updated_at.localtime.strftime("%m/%d/%Y at %I:%M%p %Z")
  end

  def user
    self.object.user.username
  end

  belongs_to :user

end
