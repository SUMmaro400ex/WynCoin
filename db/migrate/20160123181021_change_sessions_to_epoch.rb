class ChangeSessionsToEpoch < ActiveRecord::Migration
  def change
    rename_table :sessions, :epochs
  end
end
