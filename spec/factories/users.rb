FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { 'kkk@gamil' }
    password { 'ht3678' }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.birthday }
  end
end
