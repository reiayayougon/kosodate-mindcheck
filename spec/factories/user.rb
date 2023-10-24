FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "sample#{n}@example.com" } 
        sequence(:name)  { |n| "name{n}" }
        status { 100 }
        avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/example.jpg').to_s) }
        factory :other_user do
            sequence(:email) { |n| "other_user#{n}@example.com" }
            name { "Other User" }
        end
    end
end