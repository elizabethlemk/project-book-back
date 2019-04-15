class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy
  has_many :blog_posts, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
end
