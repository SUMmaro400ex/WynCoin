class AddAmountToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :amount, :numeric
  end
end
