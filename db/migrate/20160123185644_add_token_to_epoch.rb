class AddTokenToEpoch < ActiveRecord::Migration
  def change
    add_column :epochs, :token, :string
  end
end
