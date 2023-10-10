require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:like) { create(:like, user: user, post: post) }

  it 'ユーザーが投稿にいいねできること' do
    expect(like).to be_valid
    expect(user.likes).to include(like)
    expect(post.likes).to include(like)
  end
end
  