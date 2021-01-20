FactoryBot.define do
  factory :purchase_address do
    post_cord { "000-0000" }
    delivery_area_id { 2 }
    municipalities { "横浜市" }
    address { "青山" }
    building { "tatemono" }
    telephone { "00000000000" }
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 2 }
    item_id { 2 }
  end
end
