class LiveUpdatesChannel < ApplicationCable::Channel
  def subscribed
    puts "PARAMS" * 100, params.inspect, "params" * 100
    stream_from "guide_channel_#{params[:id]}"
  end
end
