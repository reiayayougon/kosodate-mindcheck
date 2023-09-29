FactoryBot.define do
    factory :post do
        sequence(:content) { |n| "本文#{n}" }
        association :user
        association :category
    end
end
