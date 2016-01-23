class AddStatusToEpoch < ActiveRecord::Migration
  def change
    add_column :epochs, :status, :string, default: "open"
  end
end
