FactoryBot.define do
  factory :answer do
    answer_select { 1 }
    user { nil }
    question { nil }
  end
end
