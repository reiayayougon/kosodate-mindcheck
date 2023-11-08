class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(content: data['message'], user_id: current_user.id, post_id: data['room_id'], created_at: Time.now)
  end

end
