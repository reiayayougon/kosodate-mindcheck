require 'rails_helper'

RSpec.describe "Likes", type: :system do
    let!(:user) { create(:user) }
    let!(:post) { create(:post) }

    describe 'いいね機能' do
        before do
            login_with_google
            visit posts_path
        end

        it 'いいねボタンが表示されていること' do 
            expect(page).to have_selector('.like_button')
        end

        it 'いいねの作成' do
            find('.like_button').click
            expect(page).to have_selector('.unlike_button')
        end

        it 'いいねの削除' do
            find('.like_button').click
            find('.unlike_button').click
            expect(page).to have_selector('.like_button')
        end

        it '未ログインユーザーはいいねできないこと' do
            visit posts_path
            expect(page).not_to have_button('.like_button')
        end
    end
end
