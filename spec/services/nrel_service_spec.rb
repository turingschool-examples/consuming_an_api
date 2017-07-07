require 'rails_helper'

describe NrelService do
  context ".find_nearest" do
    it "returns an array of hashes" do
      VCR.use_cassette("nrel_service.find_nearest") do
        raw_stations = NrelService.find_nearest(location: "80203")
        raw_station  = raw_stations.first

        expect(raw_stations).to be_an Array
        expect(raw_stations.count).to eq(10)
        expect(raw_station).to have_key(:station_name)
        expect(raw_station[:station_name]).to be_a String
        expect(raw_station).to have_key(:access_days_time)
        expect(raw_station[:access_days_time]).to be_a String
        expect(raw_station).to have_key(:fuel_type_code)
        expect(raw_station[:fuel_type_code]).to be_a String
        expect(raw_station).to have_key(:street_address)
        expect(raw_station[:street_address]).to be_a String
        expect(raw_station).to have_key(:city)
        expect(raw_station[:city]).to be_a String
        expect(raw_station).to have_key(:state)
        expect(raw_station[:state]).to be_a String
        expect(raw_station).to have_key(:zip)
        expect(raw_station[:zip]).to be_a String
        expect(raw_station).to have_key(:distance)
        expect(raw_station[:distance]).to be_a Float
      end
    end
  end
end
