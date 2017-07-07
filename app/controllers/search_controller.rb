class SearchController < ApplicationController
  def index
    @stations = Station.find_nearest(location: params[:search])
  end
end

