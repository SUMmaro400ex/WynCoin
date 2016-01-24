require "rails_helper"

RSpec.describe "Transactions", :type => :request do
  describe "POST /epochs/:epoch_token/transactions/new" do
    let(:account) { create :account }
    let!(:user) { create :user_with_epochs, epochs_count: 1 }
    before do
      @transaction_amount = Faker::Number.number(4).to_i
      @old_balance = user.balance
      body = {
        amount: @transaction_amount
      }
      post_with_token "/epochs/#{user.epochs.first.token}/transactions/new", body
    end
    it "shold respond ok" do
      expect(json_response[:status]).to eq("ok")
    end
    it "should respond with new user balance" do
      expect(json_response[:user_balance].to_i).to eq(@old_balance - @transaction_amount)
    end
    it "should respond with epoch amount" do
      expect(json_response[:epoch_amount].to_i).to eq(user.epochs.first.amount)
    end
  end
end
