FactoryGirl.define do
  factory :transaction do
    epoch
    ammount { Faker::Number.number(6) }
  end

end
