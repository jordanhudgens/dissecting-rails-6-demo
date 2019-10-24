class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])
    @guides = @topic.guides.order("created_at DESC").page(params[:page]).per(20)
  end
end
