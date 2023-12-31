require 'rails_helper'

RSpec.describe 'Omniauth', type: :system do
    let(:user) { create(:user) }
    describe "googleアカウントでログイン" do 
        before do
            OmniAuth.config.mock_auth[:google_oauth2] = google_mock(user)
        end

        context 'emailが取得できない場合' do
            it 'google認証でログイン失敗' do
                OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
                    provider: 'google_oauth2',
                    uid: '123456',
                    info: {
                        email: nil,
                    }
                )
                visit root_path
                find('.login').click
                sleep 1
                expect(page).to have_content "ログインに失敗しました"
            end
        end
            
        context 'emailが取得できた場合' do
            it "google認証でログイン成功" do
                visit root_path
                find('.login').click
                sleep 1
                expect(page).to have_content 'ログインしました'
            end
        end
    end
end