FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    content { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    delivery_area_id { 2 }
    delivery_day_id { 2 }
    price { 300 }
    association :user 
  end
end
