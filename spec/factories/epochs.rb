FactoryGirl.define do
  factory :epoch do
    user
    account
     # user_with_posts will create post data after the user has been created
    factory :epoch_with_transactions do
      # posts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        transactions_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |epoch, evaluator|
        create_list(:transaction, evaluator.transactions_count, epoch: epoch)
      end
    end
  end

end
