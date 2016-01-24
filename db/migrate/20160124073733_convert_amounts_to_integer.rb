class ConvertAmountsToInteger < ActiveRecord::Migration
  def change
    change_column :transactions, :amount, :integer
  end
end
