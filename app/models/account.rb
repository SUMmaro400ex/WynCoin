class Account < ActiveRecord::Base
  before_create :generate_authentication_token!
  has_many :epochs

  def generate_authentication_token!
    begin
      self.api_token = Digest::SHA1.hexdigest Time.now.to_s
    end while self.class.exists?(api_token: api_token)
  end
end
