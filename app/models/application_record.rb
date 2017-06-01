require_relative '../services/weather_service'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
