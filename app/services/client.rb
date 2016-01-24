class Client
  require 'coinbase/wallet'

  def self.get
    Coinbase::Wallet::Client.new(api_key: ENV['CB_API_KEY'], api_secret: ENV['CB_API_SECRET'], api_url: "https://api.sandbox.coinbase.com")
  end
end
