class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :answers

  validates :content, presence: true, length: { maximum: 255 }
end
