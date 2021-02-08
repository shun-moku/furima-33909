FactoryBot.define do
  factory :item do
    name              { Faker::Coffee.blend_name }
    description                 { Faker::Movies::StarWars.quote }
    category_id              { Faker::Number.between(from: 2, to: 11) }
    condition_id                { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id          { Faker::Number.between(from: 2, to: 3) }
    region_id           { Faker::Number.between(from: 2, to: 48) }
    delivery_date_id           { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9999999) }
    image            {'apps/assets/images/flag.png'}
    association :user 
  end
end
