FactoryBot.define do
  factory :purchase_address do
    post_cord { 000-0000 }
    delivery_area_id { 2 }
    municipalities { "横浜市" }
    address { "青山" }
    telephone { 00000000000 }
  end
end
