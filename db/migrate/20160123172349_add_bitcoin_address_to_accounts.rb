class AddBitcoinAddressToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :bitcoin_address, :string
  end
end
