class TransferBitcoin
  require 'coinbase/wallet'

  def self.call(account, amount)
    client = Client.get
    account = client.primary_account
    address = GetWalletAddressForAccount.call(account)
    btc = CurrencyConverter.call(amount.to_digits, :satoshi)
    if address && amount
      account.send(to: address, amount: btc.to_s , currency: "BTC", description: "Payment")
      true
    else
      false
    end
  end
  
end
