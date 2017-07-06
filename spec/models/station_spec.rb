require 'rails_helper'

describe Station do
  it "is a legit station" do
    raw_station = {
      :station_name=>"Shell",
      :access_days_time=>"24 hours daily",
      :fuel_type_code=>"ELEC",
      :street_address=>"1510 Blake St",
      :city=>"Denver",
      :state=>"CO",
      :zip=>"80203",
      :distance=>0.31422
    }


    station = Station.new(raw_station)

    expect(station.name).to eq("Shell")
    expect(station.address).to eq("1510 Blake St Denver, CO 80203")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("24 hours daily")
    expect(station.distance).to eq(0.31422)
  end
end

