FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1,)}
    password_confirmation {password}
    first_name {Gimei.name.first.kanji}
    last_name {Gimei.name.last.kanji}
    kana_first_name {Gimei.name.first.katakana}
    kana_last_name {Gimei.name.last.katakana}
    birth {Faker::Date.birthday(min_age: 16, max_age: 60)}
  end
end