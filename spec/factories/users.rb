FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6, special_characters: false) + '1a' }
    password_confirmation { password }

    first_name            { '太郎' }
    last_name             { '山田' }
    first_name_reading    { 'タロウ' }
    last_name_reading     { 'ヤマダ' }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
