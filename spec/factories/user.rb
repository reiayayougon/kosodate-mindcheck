FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "sample#{n}@example.com" } 
        sequence(:name) { |n| "first_name{n}" }
    end
end