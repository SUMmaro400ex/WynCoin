require 'faker'

FactoryGirl.define do

  factory :account do
    api_token { Faker::Code.ean }
    bitcoin_address { Faker::Bitcoin.address }
  end

end
