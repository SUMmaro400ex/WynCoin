class GetWalletAddressForAccount
  def self.call(account_id)
    @account = Account.find(account_id)
    if @account
      @account.bitcoin_address
    else
      nil
    end
  end
end
