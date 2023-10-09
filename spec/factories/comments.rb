FactoryBot.define do
  factory :comment do
    sequence(:content) { |n| "本文#{n}" }
    association :user
    association :post
  end 

  factory :comment_by_me do
    content {"自分のコメント"}
    association :user
    association :post
  end
  
  factory :comment_by_others do
    content {"他人のコメント"}
    association :user
    association :post
  end
end
