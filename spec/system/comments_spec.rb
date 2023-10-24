require 'rails_helper'

RSpec.describe "Comments", type: :system do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let(:comment_by_me) { create(:comment, user: user, post: post) }
    let(:comment_by_others) { create(:comment, post: post) }

    describe 'コメントCRUD' do
        before do
            comment_by_me
            comment_by_others
        end

        describe 'コメントの一覧' do
            it 'コメントの一覧が表示されること' do
                login_with_google
                visit post_path post
                within('#comment') do
                    expect(page).to have_content(comment_by_me.content)
                    expect(page).to have_content(comment_by_me.user.name)
                end
            end
        end

        describe 'コメントの作成' do
            it 'コメントの作成ができること' do 
                login_with_google
                visit post_path post
                fill_in 'comment[content]', with: '新規コメント'
                click_on '投稿'
                comment = Comment.last
                within("#comment_#{comment.id}") do
                    expect(page).to have_content(user.name)
                    sleep(2)
                    expect(page).to have_content('新規コメント')
                end
            end

            it 'コメントの作成に失敗すること', turbo: true do
                login_with_google
                visit post_path post
                fill_in 'comment[content]', with: ''
                click_on '投稿'
                expect(Comment.count).to eq(2)
            end

            describe 'コメントの編集' do
                context '他人のコメントの場合' do
                    it '編集ボタン・削除ボタンが表示されないこと' do
                        login_with_google
                        visit post_path post
                        within("#comment_#{comment_by_others.id}") do
                            expect(page).not_to have_selector('.js-edit-comment-button')
                            expect(page).not_to have_selector('.js-delete-comment-button') 
                        end
                    end
                end
            end
        end
    end


end

