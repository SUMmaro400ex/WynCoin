class TransferBitcoin
  require 'coinbase/wallet'

  def self.call(origin_user_id, account_id, amount)
    client = Client.get
    account = client.primary_account
    address = GetWalletAddressForAccount.call(account_id)
    btc = CurrencyConverter.get(amount, :satoshi)
    if address && amount && origin_user_id
      account.send(to: address, amount: btc.to_s , currency: "BTC", description: "Payment")
    end
      #return true or false for succ3ss

  end
end
