FactoryBot.define do
  factory :day do
    date { DateTime.now.to_date }
    amount { 100 }
    store_id { 1 }
    goal_id { 1 }
    vendors { [1] }
  end
end
