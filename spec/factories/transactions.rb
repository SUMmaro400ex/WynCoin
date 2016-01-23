FactoryGirl.define do
  factory :transaction do
    epoch
    amount { Faker::Number.number(6) }
  end

end
