class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 65_535 }

  def self.ransackable_attributes(auth_object = nil)
    %w[content category_id]
  end
end