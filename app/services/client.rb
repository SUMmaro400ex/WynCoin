class Client
  require 'coinbase/wallet'

  def self.get
    Coinbase::Wallet::Client.new(api_key: "7t2dGSzhqRQVXYdC", api_secret: "WPHkOIrf0kchL57rYCRHfJ4U1cqCxoAQ", api_url: "https://api.sandbox.coinbase.com")
  end
end
