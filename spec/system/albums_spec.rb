require 'rails_helper'

RSpec.describe "Albums", type: :system do
    let(:user) { create(:user) }
    let(:album) { create(:album, user: user)}
    describe 'アルバムの作成' do
        context 'ログインしている場合' do
            before do
                login_with_google
                find('.dropdown-orenge').click
                click_link 'アルバム作成'
            end

            it 'アルバムが作成できること' do
                fill_in 'タイトル', with: 'タイトル'
                fill_in '内容', with: '内容'
                file_path = Rails.root.join('spec', 'fixtures', 'example.jpg')
                attach_file "画像", file_path
                expect(page).to have_selector("img[src^='data:image/jpeg;base64,']")
                click_button '投稿'
                expect(page).to have_content('アルバムを作成しました')
                expect(page).to have_content('タイトル')
                expect(page).to have_selector("img[src$='example.jpg']")
            end

            it 'アルバムの作成ができないきこと' do
                fill_in 'タイトル', with: ''
                fill_in '内容', with: '内容'
                click_button '投稿'
                expect(page).to have_content('アルバムを作成できませんでした')
            end

            it '画像の詳細が見れること' do
                visit album_path(album)
                expect(page).to have_content(album.title)
                expect(page).to have_content(album.introduction)
                expect(page).to have_selector("img[src$='example.jpg']")
            end
        end

        context 'ログインしていない場合' do
            it 'トップページにリダイレクトされること' do
                visit albums_path
                expect(current_path).to eq(root_path)
                expect(page).to have_content('ログインしてください')
            end
        end
    end
end
