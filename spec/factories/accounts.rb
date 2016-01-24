require 'faker'

FactoryGirl.define do

  factory :account do
    api_token { Faker::Code.ean }
    bitcoin_address { Faker::Bitcoin.address }
    password { Faker::Internet.password }
    company_name { Faker::Company.name }
    email { Faker::Internet.email }
  end

end
