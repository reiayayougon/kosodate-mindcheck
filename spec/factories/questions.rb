FactoryBot.define do
  factory :question do
    content { "MyText" }
    category { nil }
    user { nil }
  end
end
