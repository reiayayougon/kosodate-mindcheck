require 'rails_helper'

RSpec.describe RoomChannel, type: :channel do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    before do
        stub_connection current_user: user
        subscribe(room_id: post.id)
    end

    it '正常に接続すること' do
        expect(subscription).to be_confirmed
    end

    it 'メッセージを受信し、保存するること' do
        message = 'Hello, World!'
        expect {
            perform('speak', message: message, room_id: post.id)
        }.to change(Message, :count).by(1)

        saved_message = Message.last
        expect(saved_message.content).to eq(message)
        expect(saved_message.user).to eq(user)
        expect(saved_message.post_id).to eq(post.id)
    end
end