class TransferBitcoin
  require 'coinbase/wallet'

  def self.call(account, amount)
    coinbase_client = Client.get
    coinbase_account = coinbase_client.primary_account
    address = GetWalletAddressForAccount.call(account)
    btc = CurrencyConverter.call(amount.to_digits, :satoshi)
    if address && amount
      coinbase_account.send(to: address, amount: btc.to_s , currency: "BTC", description: "Payment")
      true
    else
      false
    end
  end
  
end
