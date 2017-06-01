require 'rails_helper'

describe "Destination" do
  it "has a 10 day forecast" do
    VCR.use_cassette("destination weather") do

      destination = Destination.create(name: "St. Louis", zip: "63109", description: "a cool place", image_url: "stl.url")
      forecast = destination.ten_day_forecast(destination.zip)

      expect(forecast.count).to eq(10)
      expect(forecast.second.date).to eq("Sunday, May 28")
      expect(forecast.second.high).to eq("79")
      expect(forecast.second.low).to eq("58")
      expect(forecast.second.conditions).to eq("Chance of a Thunderstorm")
      expect(forecast.last.date).to eq("Monday, June 5")
      expect(forecast.last.high).to eq("80")
      expect(forecast.last.low).to eq("63")
      expect(forecast.last.conditions).to eq("Chance of Rain")
    end
  end
end