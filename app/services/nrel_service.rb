class NrelService
  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: "https://developer.nrel.gov")
  end

  def find_nearest
    response = conn.get "/api/alt-fuel-stations/v1/nearest.json", default_filter.merge(filter)
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def self.find_nearest(filter)
    new(filter).find_nearest
  end

  private
    attr_reader :filter, :conn

    def default_filter
      {
        api_key: ENV['nrel_api_key'],
        limit: 10,
        radius: 6,
        fuel_type: "ELEC,LPG"
      }
    end
end
