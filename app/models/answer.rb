class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  enum answer_select: { yes: 0, no: 1 }
  
  scope :yes_count, -> { where(answer_select: 'yes').count }
end
