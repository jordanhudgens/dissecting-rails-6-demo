class StaticController < ApplicationController
  def homepage
    @guides = Guide.last(20)
  end
end
