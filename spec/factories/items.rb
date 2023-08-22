FactoryBot.define do
  factory :item do

    association :user

    item_name          {"hoge"}
    item_description   {Faker::Lorem.sentence}
    item_condition_id  {2}
    shipping_cost_id   {2}
    shipping_origin_id {13}
    days_to_ship_id    {2}
    price              {9999}
    category_id        {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end