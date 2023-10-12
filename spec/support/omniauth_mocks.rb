module OmniauthMocks
    def google_mock(user)
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
            :provider => "google_oauth2",
            :uid => "123456",
            :info => {
                :name => user.name,
                :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
                :email => user.email
            }
            # :credentials => {
            #     :token => "a1b2c3d4...",
            #     :secret => "abcdef1234"
            # }
        }
    )
    end
end