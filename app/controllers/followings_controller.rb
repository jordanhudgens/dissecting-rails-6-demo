class FollowingsController < ApplicationController
  def create
    following = Following.new
    following.followed_id = current_user.id
    following.follower_id = User.find(params[:user_id_to_follow])

    if following.save
      render json: { following: following, status: 200 }
    else
      render json: { errors: following.errors, status: 422 }
    end
  end
end
