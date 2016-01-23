class AddAmountToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :amount, :numeric
  end
end
