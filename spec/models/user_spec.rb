require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".balance" do
    let!(:account) { create :account }
    let!(:user) { create :user }
    let!(:epoch) { create :epoch }

    before do
      epoch.transactions.create(ammount: 5000000)
      epoch.transactions.create(ammount: 4000000)
      user.epoch.create(account: account).transactions.create(ammount: 1000000)
    end

    it "calculates the balance accross all epochs" do
      expect(user.balance).to eq(10000000)
    end
  end
end
