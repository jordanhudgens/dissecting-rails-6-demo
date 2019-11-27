class StaticController < ApplicationController
  def homepage
    if current_user
      @guides = UserFeed
                  .new(current_user)
                  .call
                  .page(params[:page])
                  .per(20)
    else
      @guides = Guide
                  .order("created_at DESC")
                  .page(params[:page])
                  .per(20)
    end
  end
end
