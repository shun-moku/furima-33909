FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    region_id { 4 }
    city { '東京都' }
    street_number { '1-1' }
    building { '東京ハイツ' }
    phone_number {'08000000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
