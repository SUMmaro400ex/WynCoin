class TransferBitcoin
  require 'coinbase/wallet'

  def self.call(account, amount)
    coinbase_client = Client.get
    coinbase_account = coinbase_client.primary_account
    btc = CurrencyConverter.call(amount.to_s, :satoshi)
    if  amount
      coinbase_account.send(to: account.bitcoin_address, amount: btc.to_s , currency: "BTC", description: "Payment")
      true
    else
      false
    end
  end
  
end
