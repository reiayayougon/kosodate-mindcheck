require 'rails_helper'

RSpec.describe "Questions", type: :system do
    let(:user) { create(:user) }
    let(:question) { create_list(:question, 10) }
    describe '質問の表示' do
        context 'ログインしている場合' do
            before do
                login_with_google
                page.set_rack_session(question_history: [], question_id: nil)
                page.set_rack_session(question_id: question.first.id)
                visit start_questions_path
                click_link '子育てマインドチェック開始'
            end

            it '質問が出題されること' do
                expect(page).to have_selector('.question')
                click_button 'YES'
                expect(page.get_rack_session['question_history']).not_to be_empty
            end

            it 'ランダムに10問質問が出題されること' do
                question_history = []
                10.times do
                    # 質問表示
                    expect(page).to have_selector('.question')
                    # 回答
                    click_button 'YES'
                    # 質問履歴に質問IDが追加されていることを確認
                    question_history << Question.last.id
                    # 質問履歴が10問以上になった場合、古い履歴が削除されていることを検証
                    if question_history.size > 10
                        expect(question_history.size).to eq(10)
                    end
                end
            end

            it '同じ質問が出題されないこと' do
                question_history = []
                10.times do
                    current_question = find('.question').text
                    # 選択された質問がすでにリストに含まれていないことを確認
                    expect(question_history).not_to include(current_question)
                    question_history << Question.last.id
                    click_button 'YES'
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
