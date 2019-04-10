class Note < ApplicationRecord
  belongs_to :project, dependent: :destroy

  validates :comment, presence: true
end
