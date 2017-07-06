class SearchController < ApplicationController
  def index
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&location=80203&limit=10&radius=6&fuel_type=ELEC,LPG")
    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end
end

