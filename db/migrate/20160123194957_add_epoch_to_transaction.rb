class AddEpochToTransaction < ActiveRecord::Migration
  def change
    add_reference :transactions, :epoch, index: true, foreign_key: true
  end
end
