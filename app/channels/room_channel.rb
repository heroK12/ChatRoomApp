class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    message = Message.new(
      content: data["message"],
      user_id: data['user_room']["user_id"],
      room_id: data["user_room"]["room_id"]
    )
    if message.save
      ActionCable.server.broadcast "room_channel_#{params['room_id']}", message: data['message'], user_id: data['user_room']['user_id']
    end
  end
end
