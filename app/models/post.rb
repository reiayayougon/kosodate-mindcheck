class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :category_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[content category_id]
  end
end
