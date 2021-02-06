FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000a'}
    password_confirmation {password}
    family_kanji          {'山田'}
    first_kanji           {'太郎'}
    family_kana           {'ヤマダ'}
    first_kana            {'タロウ'}
    birthday              {'2021-12-24'}
  end
end