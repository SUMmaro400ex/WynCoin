require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".balance" do
    let!(:account) { create :account }
    let!(:user) { create :user }
    let!(:epoch) { create :epoch, user: user }

    before do
      user.purchases.create(amount: 10000000)
      epoch.transactions.create(amount: 5000000)
      epoch.transactions.create(amount: 4000000)
      user.epochs.create(account: account).transactions.create(amount: 1000000)
    end

    it "calculates the balance accross all epochs" do
      expect(user.balance).to eq(0)
    end
  end
end
