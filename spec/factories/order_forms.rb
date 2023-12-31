FactoryBot.define do
  factory :order_form do
    token {"tok_abcdefghijk00000000000000000"}
    # user_id { Faker::Number.non_zero_digit }
    # item_id { Faker::Number.non_zero_digit }
    postal_code { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    shipping_origin_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_address { Faker::Address.building_number }
    phone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
  end
end

