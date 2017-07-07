require 'rails_helper'

feature "User can search for stations by zip" do
  scenario "input is a valid zip" do
    VCR.use_cassette("user_can_search_for_stations") do
      visit "/"
      fill_in :search, with: "80203"
      click_on "Locate"

      # Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to eq("/search")
      expect(page).to have_selector(".station", count: 10)

      within first(".station") do
        expect(page).to have_selector(".station_name")
        expect(page).to have_selector(".station_address")
        expect(page).to have_selector(".station_fuel_type")
        expect(page).to have_selector(".station_distance")
        expect(page).to have_selector(".station_access_times")
      end
    end
  end
end

