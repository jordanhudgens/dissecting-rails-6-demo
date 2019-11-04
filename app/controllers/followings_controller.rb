class FollowingsController < ApplicationController
  def create
    render json: { params: params.inspect }
  end
end
