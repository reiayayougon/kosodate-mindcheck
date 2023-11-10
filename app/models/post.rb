class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :answers
  

  validates :content, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  
  
  scope :user_with_most_yes_answers, -> {
    select('posts.user_id')
        .joins(:answers)
        .where('answers.answer_select = ?', 1)  
        .group('posts.user_id')
        .order('COUNT(answers.id) DESC')
        .limit(1)
    }

  def self.ransackable_attributes(_auth_object = nil)
    %w[content category_id]
  end
end
