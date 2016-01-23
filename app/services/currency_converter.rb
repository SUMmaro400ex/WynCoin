class CurrencyConverter

  def self.call(amount, type)
    @client = Client.get
    if type == :usd
      rate = @client.buy_price
      if rate
        amount.to_f / rate
      end
    elsif type == :satoshi
      if amount.length <= 8
        (8 - amount.length).times do |i|
          amount.prepend("0")
        end
        amount.prepend(".")
      else
        position = amount.length - 8
        amount.insert(position, ".")
      end
    end
  end

end
