require_relative "../lib/currency_converter"

describe CurrencyConverter do
  let(:converter) { described_class.new({ "GBP" => 0.64, "EUR" => 0.76 }) }

  it "converts one currency into another based on exchange rates" do
    expect(converter.convert(10, "GBP", "EUR")).to eq(11.875)
  end
end
