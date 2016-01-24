class CurrencyConverter

  def self.call(amount, type)
    @client = Client.get
    if type == :usd
      rate = @client.buy_price
      if rate
        puts rate
        puts rate.amount
        amount / rate.amount.to_f
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
    elsif type == :btc
      amount * 100000000
    end
  end

end
