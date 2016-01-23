class AddAccountToEpochs < ActiveRecord::Migration
  def change
    add_reference :epochs, :account, index: true, foreign_key: true
  end
end
