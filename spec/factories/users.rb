FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_kanji          {'山田'}
    first_kanji           {'太郎'}
    family_kana           {'ヤマダ'}
    first_kana            {'タロウ'}
    birthday              {Faker::Date.between(from: '1900-09-23', to: '2020-09-25')}
  end
end