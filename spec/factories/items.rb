FactoryBot.define do
  factory :item do
    name        { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { "1a#{Faker::Internet.password(min_length: 6)}" }
    status_id
    charge_id             { '田中' }
    area_id             { '田中' }
    day_id        { 'カナ' }
    price       { 'カナ' }
    birthday              { '1930-01-01' }
  end
end
