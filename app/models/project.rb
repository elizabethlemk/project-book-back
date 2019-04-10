class Project < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :links, dependent: :destroy

  has_many_attached :images, dependent: :destroy
end
