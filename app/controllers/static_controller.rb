class StaticController < ApplicationController
  def homepage
    @guides = UserFeed
                .new(current_user)
                .call
                .page(params[:page])
                .per(20)
  end
end
