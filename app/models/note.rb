class Note < ApplicationRecord
  belongs_to :project

  validates :comment, presence: true
end
