class Link < ApplicationRecord
  belongs_to :project, dependent: :destroy
end
