class CloseEpoch
  def self.call(epoch)
    epoch.close if TransferBitcoin.call(epoch.account, epoch.amount)
  end
end
