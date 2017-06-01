require 'rails_helper'

feature "view weather info" do
  it " a user can view weather information on the show page" do
    VCR.use_cassette("destination_forecast") do

      Destination.create(name: "St. Louis", zip: "63109", description: "a cool place", image_url: "stl.url")

      visit "/"

      click_on "Show"

      expect(current_path).to eq("/destinations/1")

      expect(page).to have_content("St. Louis")
      expect(page).to have_content("63109")
      expect(page).to have_content("a cool place")
      expect(page).to have_content("Forecast for St. Louis")
      expect(page).to have_content("Monday, June 5 High: 80 / Low: 63  Chance of Rain")
    end
  end
end