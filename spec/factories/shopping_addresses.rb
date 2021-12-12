FactoryBot.define do
  factory :shopping_address do
    postal_code { '123-4567' }
    area_id { 2 }
    municipalities { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '1234567890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
