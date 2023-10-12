FactoryBot.define do
	factory :question do
		content { Faker::Lorem.sentence }
		association :user
		association :category
	end
end
