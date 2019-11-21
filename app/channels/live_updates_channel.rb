class LiveUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "guide_channel_#{params[:id]}"
  end
end
