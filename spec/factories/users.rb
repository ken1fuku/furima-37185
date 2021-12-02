FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '田中' }
    last_name_kana        { 'カナ' }
    first_name_kana       { 'カナ' }
    birthday              { '1930-01-01' }
  end
end
