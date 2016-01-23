class Account < ActiveRecord::Base
  before_create :generate_authentication_token!

  def generate_authentication_token!
    begin
      self.auth_token = Digest::SHA1.hexdigest Time.now.to_s
    end while self.class.exists?(auth_token: auth_token)
  end
end
