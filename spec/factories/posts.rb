FactoryBot.define do
    factory :post do
        sequence(:content) { |n| "本文#{n}" }
        association :user
        association :category
        
        factory :post_by_others do
            content { "This is a post." }
            user { create(:other_user) } 
        end
    end
end
