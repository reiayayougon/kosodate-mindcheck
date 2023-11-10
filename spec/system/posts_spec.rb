require 'rails_helper'

RSpec.describe "Posts", type: :system do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    let(:category) { create(:category) }
    
    
    describe '投稿のCRUD' do
        describe '投稿の作成' do
            context 'ログインしていない場合' do
                it 'トップページにリダイレクトされること' do
                    visit new_post_path
                    expect(current_path).to eq(root_path)
                    expect(page).to have_content('ログインしてください')
                end
            end

            context 'ログインしている場合' do
                before do
                    login_with_google
                    visit posts_path
                    click_link '投稿する'
                end

                it '投稿が作成できること' do
                    find("option[value='#{category.id}']").select_option
                    fill_in '内容', with: 'テスト本文'
                    click_button '投稿'
                    expect(current_path).to eq(posts_path)
                    expect(page).to have_content('投稿を作成しました')
                    expect(page).to have_content('テスト本文')
                end

                it '投稿の作成に失敗すること' do
                    fill_in '内容', with: "本文"
                    click_button '投稿'
                    expect(page).to have_content('投稿を作成できませんでした')
                end
            end
        end   
        describe '投稿の編集' do
            context '他人の投稿の場合' do
                let(:post_by_others) { create(:post_by_others) }
                it '編集ボタン・削除ボタンが表示されないこと' do
                    login_with_google
                    visit posts_path(post_by_others)
                    expect(page).not_to have_selector("#button-edit-#{post_by_others.id}")
                    expect(page).not_to have_selector("#button-delete-#{post_by_others.id}")
                end
            end
            context '自分の投稿の場合' do
                it '編集ボタン・削除ボタンが表示されること' do
                    login_with_google
                    visit posts_path post
                    expect(page).to have_selector("#button-edit-#{post.id}")
                    expect(page).to have_selector("#button-delete-#{post.id}")
                end
            end
        end
    end
end
