class Epoch < ActiveRecord::Base
  before_create :generate_token
  belongs_to :account
  belongs_to :user
  has_many :transactions

  def generate_token
    self.token = Digest::SHA1.hexdigest Time.now.to_s
  end
end
