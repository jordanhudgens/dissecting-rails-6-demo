class StaticController < ApplicationController
  def homepage
    @guides = UserFeed.new(current_user).call
  end
end
