class SearchController < ApplicationController
  def index
    @house = params[:house]
    service = SearchService.new
    result_json = render json: service.get_phoenix(@house)
    result = JSON.parse(result_json, symbolize_names: true)
    result
  end
end
