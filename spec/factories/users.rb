require 'faker'

FactoryGirl.define do

  factory :user do
    facebook_id { Faker::Code.ean }
  end

end
