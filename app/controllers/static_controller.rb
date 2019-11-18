class StaticController < ApplicationController
  def homepage
    if current_user
      ids = current_user.following.pluck(:id)
      @guides = Guide.where(user_id: ids)
    else
      @guides = Guide.last(20)
    end
  end
end
