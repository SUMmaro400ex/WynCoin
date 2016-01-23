class Epoch < ActiveRecord::Base
  before_create :generate_token
  belongs_to :account
  belongs_to :user
  has_many :transactions

  def close
    self.update(status: "closed")
  end
  
  def generate_token
    self.token = Digest::SHA1.hexdigest Time.now.to_s
  end

  def amount
    self.transactions.pluck(:amount).reduce(:+)
  end
end
