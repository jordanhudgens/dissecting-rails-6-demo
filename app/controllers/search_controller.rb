class SearchController < ApplicationController
  def search_query
    @guides = Guide.search_by_term(params[:q])
  end
end
