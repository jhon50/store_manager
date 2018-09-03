FactoryBot.define do
  factory :store do
    id { 1 }
    name { 'Test Store' }
    address { 'Rua teste, 120' }
    user_id { 1 }
  end
end
