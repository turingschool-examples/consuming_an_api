class Station
  attr_reader :name, :fuel_type, :distance, :access_times

  def initialize(attrs)
    @attrs = attrs
    @name = attrs[:station_name]
    @fuel_type = attrs[:fuel_type_code]
    @access_times = attrs[:access_days_time]
    @distance = attrs[:distance]
  end

  def address
    "#{attrs[:street_address]} #{attrs[:city]}, #{attrs[:state]} #{attrs[:zip]}"
  end

  def self.find_nearest(filter)
    NrelService.find_nearest(filter).map do |raw_station|
      new(raw_station)
    end
  end

  private
    attr_reader :attrs
end

