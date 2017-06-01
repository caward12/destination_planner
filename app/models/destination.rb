
class Destination < ApplicationRecord

  def ten_day_forecast(zip)
    Forecast.ten_day_forecast(zip)
  end
end
