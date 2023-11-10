require 'rails_helper'

RSpec.describe "Questions", type: :system do
    let(:user) { create(:user) }
    let!(:post) { create_list(:post, 10) }
    let!(:yes_answer) { create(:yes_answer) }
    let!(:no_answer) { create(:no_answer) }
    describe '質問の表示' do
        context 'ログインしている場合' do
            before do
                login_with_google
                page.set_rack_session(post_history: [], post_id: nil)
                page.set_rack_session(post_id: post.first.id)
                visit start_questions_path
                click_link '仲間とマッチング'
            end

            it '質問が出題されること' do
                expect(page).to have_selector('.question')
                click_button '共感'
                expect(page.get_rack_session['post_history']).not_to be_empty
            end

            it 'ランダムに10問質問が出題されること' do
                post_history = []
                10.times do
                    # 質問表示
                    expect(page).to have_selector('.question')
                    # 回答
                    click_button '共感'
                    # 質問履歴に質問IDが追加されていることを確認
                    post_history << Post.last.id
                    # 質問履歴が10問以上になった場合、古い履歴が削除されていることを検証
                    if post_history.size > 10
                        expect(post_history.size).to eq(10)
                    end
                end
            end

            it '同じ質問が出題されないこと' do
                post_history = []
                10.times do
                    current_post = find('.question').text
                    # 選択された質問がすでにリストに含まれていないことを確認
                    expect(post_history).not_to include(current_post)
                    post_history << Post.last.id
                    click_button '共感'
                end
            end
        end

        context 'ログインしてない場合' do
            it 'トップページにリダイレクトされること' do
                visit profile_path
                expect(current_path).to eq(root_path)
                expect(page).to have_content('ログインしてください')
            end
        end
    end      
end
