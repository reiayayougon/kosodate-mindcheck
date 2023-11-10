class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user

  

  validates :content, presence: true, length: { maximum: 255 }
end
