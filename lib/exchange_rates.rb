require 'date'
require 'open-uri'
require 'json'

class ExchangeRates
  def initialize(app_id, date = nil)
    @endpoint = 'http://openexchangerates.org/api'
    @endpoint+= date.nil? ? "/latest" : "/historical/#{date.strftime("%Y-%m-%d")}"
    @endpoint+= ".json?app_id=#{app_id}"
  end

  def [](currency)
    data[currency]
  end

private
  def data
    @data ||= fetch_data
  end

  def fetch_data
    json = open(@endpoint).read
    JSON.parse(json)['rates']
  end
end
