class FollowingsController < ApplicationController
  def create
    user_to_follow = User.find(params[:user_id_to_follow])
    following = Following.new
    following.follower_id = current_user.id
    following.followed_id = user_to_follow.id

    if following.save!
      render json: { following: following, status: 200 }
    else
      render json: { errors: following.errors, status: 422 }
    end
  end

  def destroy
    following = Following.find_by(
      follower_id: current_user.id,
      followed_id: params[:id]
    )

    if following.destroy
      render json: { msg: "USER_UNFOLLOWED" }
    else
      render json: { errors: following.errors, status: 422 }
    end
  end
end
