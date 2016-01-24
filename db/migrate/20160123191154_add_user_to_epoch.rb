class AddUserToEpoch < ActiveRecord::Migration
  def change
    add_reference :epochs, :user, index: true, foreign_key: true
  end
end