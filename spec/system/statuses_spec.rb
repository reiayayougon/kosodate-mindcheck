require 'rails_helper'

RSpec.describe "Statuses", type: :system do
    let(:user) { create(:user) }
    let(:post) { create_list(:post, 10) }
    let(:yes_answer) { create(:yes_answer) }
    let(:no_answer) { create(:no_answer) }

    describe 'ユーザーステータスの変化' do
        before do
            login_with_google
            page.set_rack_session(post_history: [], post_id: nil)
            page.set_rack_session(post_id: post.first.id)
            visit start_questions_path
        end
        context 'YESと回答した場合' do
            it 'ステータスが増えること' do
                user_status_before = user.status
                puts "user_status_before: #{user_status_before}"
                click_link '仲間とマッチング'
                expect(page).to have_selector('.question')
                click_button '共感'
                create(:answer, user: user, post: yes_answer.post, answer_select: 'yes')
                expect(page).to have_selector('.question')
                puts "user_status_after: #{User.find(user.id).status}"
                user_status_after = User.find(user.id).status
                expect(user_status_after).to eq(user_status_before + 1)
            end
        end

        context 'NOと回答した場合' do
            it 'ステータスが増えないこと' do
                click_link '仲間とマッチング'
                expect(page).to have_selector('.question')
                user_status_before = user.status
                create(:answer, user: user, post: no_answer.post, answer_select: 'no')
                click_button '共感しない'
                user_status_after = User.find(user.id).status
                expect(user_status_after).to eq(user_status_before)
            end
        end

    end
end
