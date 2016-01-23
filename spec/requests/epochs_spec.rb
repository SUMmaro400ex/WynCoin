require "rails_helper"

RSpec.describe "Epochs", :type => :request do
  let(:account) { create :account }
  let(:user) { create :user }
  describe "POST /epochs/new" do
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
      epoch_token = response.body["epoch_token"]
      epoch = Epoch.find_by_token!(epoch_token)
      expect(epoch.account).to eq(account)
    end
    it "should respond with user balance"
  end
end
