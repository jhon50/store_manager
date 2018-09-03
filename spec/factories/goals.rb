FactoryBot.define do
  factory :goal do
    id { 1 }
    start_date { DateTime.now.to_date }
    end_date { 5.days.from_now }
    ref_month { 'july' }
    amount { 200 }
    store_id { 1 }
  end
end
