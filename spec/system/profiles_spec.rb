require 'rails_helper'

RSpec.describe "Profiles", type: :system do
    let(:user) { create(:user) }

    describe 'プロフィールの作成' do
        context 'ログインしていない場合' do
            it 'トップページにリダイレクトされること' do
                visit profile_path
                expect(current_path).to eq(root_path)
                expect(page).to have_content('ログインしてください')
            end
        end

        context 'ログインしている場合' do
            before do
                login_with_google
                find('.dropdown-user').click
                click_link 'プロフィール'
            end

            it 'プロフィールが作成できること' do
                fill_in '名前', with: '名前1'
                fill_in '自己紹介', with: '自己紹介1'
                file_path = Rails.root.join('spec', 'fixtures', 'example.jpg')
                attach_file "アバター", file_path
                expect(page).to have_selector("img[src^='data:image/jpeg;base64,']")
                click_button '更新'
                expect(page).to have_content('プロフィールを更新しました')
                expect(page).to have_content('名前1')
                expect(page).to have_content('自己紹介1')
                expect(page).to have_selector("img[src$='example.jpg']")
            end

            it 'プロフィールが作成できないこと' do
                fill_in '名前', with: ''
                fill_in '自己紹介', with: '自己紹介1'
                file_path = Rails.root.join('spec', 'fixtures', 'example.jpg')
                attach_file "アバター", file_path
                expect(page).to have_selector("img[src^='data:image/jpeg;base64,']")
                click_button '更新'
                expect(page).to have_content("プロフィールを更新できませんでした")
            end
        end
    end   
    describe 'プロフィールの編集' do
        context '他人の投稿の場合' do
            let(:other_user) { create(:other_user) }
            it '編集ボタンが表示されないこと' do
                login_with_google
                visit user_path(other_user)
                expect(page).not_to have_selector(".edit-button")
            end
        end
        context '自分の投稿の場合' do
            it '編集ボタンが表示されること' do
                login_with_google
                visit user_path(user)
                expect(page).to have_selector(".edit-button")
            end
        end
    end  
end
