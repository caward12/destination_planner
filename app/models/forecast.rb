class Forecast

  attr_reader :day, :month, :weekday, :high, :low, :conditions

  def initialize(raw_data)
    @day = raw_data[:date][:day]
    @month = raw_data[:date][:monthname]
    @weekday = raw_data[:date][:weekday]
    @high = raw_data[:high][:fahrenheit]
    @low = raw_data[:low][:fahrenheit]
    @conditions = raw_data[:conditions]
  end

  def self.ten_day_forecast(zip)
    WeatherService.new(zip).ten_day_forecast.map do |forecast|
      Forecast.new(forecast)
    end
  end

  def date
    "#{weekday}, #{month} #{day}"
  end
end