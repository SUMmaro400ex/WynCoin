require 'faker'

FactoryGirl.define do

  factory :account do
    api_token { Faker::Code.ean }
  end

end
