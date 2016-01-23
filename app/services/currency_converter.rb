class CurrencyConverter

  def self.call(amount, type)
    @client = Client.get
    if type == :usd
      rate = @client.buy_price
      if rate
        amount / rate
      end
    elsif type == :satoshi
      amount / 100000000
    end
  end

end
