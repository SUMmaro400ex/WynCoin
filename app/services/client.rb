class Client
  require 'coinbase/wallet'

  def self.get
    Coinbase::Wallet::Client.new(api_key: "xjKvSliaZfjAOXYm", api_secret: "YCB3LPEH1ia2qIiFbPGXYBUBztGm2S9T")
  end
end
