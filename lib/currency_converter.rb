class CurrencyConverter
  def initialize(rates)
    @rates = rates
  end

  def convert(amount, from, to)
    amount * calculate_rate(from, to)
  end

private
  def calculate_rate(from, to)
    1 / @rates[from] * @rates[to]
  end
end
