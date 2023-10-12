FactoryBot.define do
    factory :album do
        album_image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/example.jpg').to_s) }
        title { "タイトル" }
        introduction { "内容" }
        association :user
    end
end
