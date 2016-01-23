class GetWalletAddressForAccount
  def self.call(account_id)
    # Returns wallet address
    @account = Account.find(account_id)
    @address = @account ? @account.bitcoin_address : nil
  end
end
