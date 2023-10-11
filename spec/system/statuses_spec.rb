require 'rails_helper'

RSpec.describe "Statuses", type: :system do
    let(:user) { create(:user) }
    let(:question) { create(:question) }
    let(:question) { create_list(:question, 10) }
    let(:yes_answer) { create(:yes_answer) }
    let(:no_answer) { create(:no_answer) }

    describe 'ユーザーステータスの変化' do
        before do
            login_with_google
            page.set_rack_session(question_history: [], question_id: nil)
            page.set_rack_session(question_id: question.first.id)
            visit root_path
        end
        context 'YESと回答した場合' do
            it 'ステータスが減ること' do
                click_link '子育てマインドチェック開始'
                expect(page).to have_selector('.question')
                user_status_before = user.status
                create(:answer, user: user, question: yes_answer.question, answer_select: 'yes')
                click_button 'YES'
                user_status_after = User.find(user.id).status
                expect(user_status_after).to eq(user_status_before - 1)
            end
        end

        context 'NOと回答した場合' do
            it 'ステータスが減らないこと' do
                click_link '子育てマインドチェック開始'
                expect(page).to have_selector('.question')
                user_status_before = user.status
                create(:answer, user: user, question: no_answer.question, answer_select: 'no')
                click_button 'NO'
                user_status_after = User.find(user.id).status
                expect(user_status_after).to eq(user_status_before)
            end
        end

        context 'ステータスが０になった場合' do
            it 'アルバム一覧ページに遷移すると回復できること' do
                user.update(status: 0)
                visit albams_path
                user_status_after = User.find(user.id).status
                expect(user_status_after).to eq(100)
            end
        end
    end
end
