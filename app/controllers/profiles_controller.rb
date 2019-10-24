class ProfilesController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @guides = @user.guides.order("created_at DESC").page(params[:page]).per(20)
  end
end
