class SearchController < ApplicationController
  def index
    @house = params[:house]
    service = render json: SearchService.new
    result = render json: service.get_phoenix(@house)
    binding.pry
  end
end
