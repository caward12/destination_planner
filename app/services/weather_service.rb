class WeatherService

  def initialize(zip)
    @zip = zip
    @key = ENV['WEATHER_KEY']
    @connection = Faraday.new("http://api.wunderground.com")
  end

  def ten_day_forecast
    data = parser(connection.get("/api/#{@key}/forecast10day/q/#{@zip}.json"))
    if data[:response][:error]
      []
    else
      parser(connection.get("/api/#{@key}/forecast10day/q/#{@zip}.json"))[:forecast][:simpleforecast][:forecastday]
    end
  end

  private

  attr_reader :connection

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end