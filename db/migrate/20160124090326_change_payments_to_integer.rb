class ChangePaymentsToInteger < ActiveRecord::Migration
  def change
    change_column :purchases, :amount, :integer
  end
end
