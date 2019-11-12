class FollowingsController < ApplicationController
  def create
    render json: { params: params.inspect, user: current_user.inspect }
  end
end
