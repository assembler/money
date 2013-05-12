require 'date'
require 'dotenv'

require_relative "support/rspec"
require_relative "support/vcr"
require_relative "support/dotenv"

require_relative '../lib/exchange_rates'

describe ExchangeRates do
  let(:app_id) { ENV.fetch('OPEN_EXCHANGE_RATES_APP_ID') }
  let(:rates) { ExchangeRates.new(app_id, Date.new(2013,05,01)) }

  it 'uses USD as base currency', :vcr do
    expect(rates['USD']).to eq(1.00)
  end

  it 'returns exchange rate for specific currency', :vcr do
    expect(rates['GBP']).to be_within(0.01).of(0.64)
    expect(rates['EUR']).to be_within(0.01).of(0.76)
  end
end
