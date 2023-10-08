FactoryBot.define do
    factory :user do
        sequence(:email) { "test@example.com" } 
        sequence(:name) { "John Q Public" }

        factory :other_user do
            sequence(:email) { |n| "other_user#{n}@example.com" }
            name { "Other User" }
        end
    end
end