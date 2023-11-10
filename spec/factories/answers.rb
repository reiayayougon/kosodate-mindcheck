FactoryBot.define do
    factory :answer do
        trait :yes do
            answer_select { 'yes' }
        end
        
        trait :no do
            answer_select { 'no' }
        end
    
        factory :yes_answer, traits: [:yes]
        
        factory :no_answer, traits: [:no]
    
        association :user, factory: :user
        association :post, factory: :post
    end
end