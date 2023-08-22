FactoryBot.define do
  factory :user do
    nick_name   { Faker::Name.initials }
    email      { Faker::Internet.email }
    password   { 'a1' + Faker::Internet.password(min_length: 4, mix_case: false) }
    password_confirmation { password }
    family_name_kanji   { 'やマ田' }
    personal_name_kanji  { '太ろウ' }
    family_name_kana  { 'ヤマダ' }
    personal_name_kana { 'タロウ' }
    birthdate { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
