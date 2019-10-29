class ProfilesController < ApplicationController
  def index
    @profiles = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.friendly.find(params[:id])
    @guides = @user.guides.order("created_at DESC").page(params[:page]).per(20)
  end
end
