class BlogPost < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
