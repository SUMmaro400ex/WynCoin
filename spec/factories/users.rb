require 'faker'

FactoryGirl.define do

  factory :user do
    facebook_id { Faker::Code.ean }
     # user_with_posts will create post data after the user has been created
    factory :user_with_epochs do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        epochs_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        create_list(:epoch_with_transactions, evaluator.epochs_count, user: user)
      end
    end
  end

end
