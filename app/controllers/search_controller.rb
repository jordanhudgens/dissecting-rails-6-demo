class SearchController < ApplicationController
  def search_query
    @query = params[:q]
    @guides = Guide.search_by_term(@query).page(params[:page]).per(20)
  end
end
