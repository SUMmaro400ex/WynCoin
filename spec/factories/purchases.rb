FactoryGirl.define do
  factory :purchase do
    amount { Faker::Number.number(6) }
  end

end
