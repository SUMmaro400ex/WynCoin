class User < ActiveRecord::Base
  has_many :epochs
  has_many :purchases
  has_many :transactions, through: :epochs

  def balance
    inflow = self.purchases.pluck(:amount).reduce(:+) || 0
    outflow = self.transactions.pluck(:amount).reduce(:+) || 0
    inflow - outflow
  end
end
