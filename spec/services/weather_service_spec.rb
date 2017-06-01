require "rails_helper"

describe WeatherService do
  context "ten_day_forecast"
  it "can pull raw 10-day weather data given zip code" do
    VCR.use_cassette("weather_service") do
      zip = "63109"
      weather = WeatherService.new(zip).ten_day_forecast

      expect(weather).to be_an(Array)
      expect(weather.first).to be_a(Hash)
      expect(weather.count).to eq(10)
    end
  end
end