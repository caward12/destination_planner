require 'rails_helper'

describe "Forecast" do
  it "can create forecast from raw data" do
    VCR.use_cassette("ten_day_forecast") do

      raw_data = stub_forecast
      forecast = Forecast.new(raw_data)

      expect(forecast.date).to eq("Saturday, May 27")
      expect(forecast.high).to eq("85")
      expect(forecast.low).to eq("63")
      expect(forecast.conditions).to eq("Chance of a Thunderstorm")
    end
  end

end