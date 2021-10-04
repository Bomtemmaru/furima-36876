FactoryBot.define do
  factory :item do
    title {Faker::JapaneseMedia::DragonBall.character}
    description {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {Faker::Number.non_zero_digit}
    condition_id {Faker::Number.non_zero_digit}
    carriage_id {Faker::Number.non_zero_digit}
    prefecture_id {Faker::Number.non_zero_digit}
    ship_day_id {Faker::Number.non_zero_digit}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
