require "rails_helper"

RSpec.describe "Epochs", :type => :request do
    let(:account) { create :account }
    let(:user) { create :user_with_epochs, epochs_count: 1 }
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
      epoch_token = json_response[:epoch_token]
      epoch = Epoch.find_by_token(epoch_token)
      expect(epoch.account).to eq(account)
      expect(epoch.status).to eq("open")
    end
    it "should respond with user balance" do
      expect(json_response["user_balance"].to_i).to eq(user.balance)
    end
  end

  describe "POST /epochs/:epoch_token/close" do
    let(:epoch) { user.epochs.first }
    before do
      allow(TransferBitcoin).to receive(:call).and_return(true)
      post_with_token "/epochs/#{epoch.token}/close"
      @epoch = Epoch.find_by_token(epoch.token)
    end

    it "should respond ok" do
      expect(response).to have_http_status(200)
    end

    it "should respond with user balance" do
      expect(json_response["user_balance"].to_i).to eq(user.balance)
    end

    it "should close the epoch" do
      expect(@epoch.status).to eq("closed")
    end

    it "should dispatch funds" do
      expect(TransferBitcoin).to have_received(:call).with(@epoch.account, @epoch.amount)
    end
  end
end
