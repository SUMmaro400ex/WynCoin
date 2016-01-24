class AddFieldsToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :email, :string
    add_column :accounts, :password_digest, :string
    add_column :accounts, :company_name, :string
  end
end
