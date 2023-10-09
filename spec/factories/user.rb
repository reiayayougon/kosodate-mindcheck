FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "sample#{n}@example.com" } 
        sequence(:name)  { |n| "name{n}" }

        factory :other_user do
            sequence(:email) { |n| "other_user#{n}@example.com" }
            name { "Other User" }
        end
    end
end