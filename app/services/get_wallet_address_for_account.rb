class GetWalletAddressForAccount
  def self.call(account)
    account = account.is_a?(Account) ? account : Account.find(account)
    account && account.bitcoin_address
  end
end
