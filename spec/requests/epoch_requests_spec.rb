require "rails_helper"

RSpec.describe "Epochs", :type => :request do
  describe "POST /epochs/new" do
    let(:account) { create :account }
    let(:user) { create :user_with_epochs, epochs_count: 1 }
    before do
      body = {
        user_facebook_token: user.facebook_id
      }
      post_with_token '/epochs/new', body
    end
    it "shold respond ok" do
      expect(response).to have_http_status(200)
    end
    it "should respond with epoch token" do
      epoch_token = json_response[:epoch_token]
      epoch = Epoch.find_by_token(epoch_token)
      expect(epoch.account).to eq(account)
    end
    it "should respond with user balance" do
      expect(json_response["user_balance"].to_i).to eq(user.balance)
    end
  end
end
