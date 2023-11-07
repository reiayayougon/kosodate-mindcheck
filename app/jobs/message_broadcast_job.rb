class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    room_id = message.post_id
    ActionCable.server.broadcast "room_#{room_id}", { message: render_message(message) }
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message})
  end
end
