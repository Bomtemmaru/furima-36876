FactoryBot.define do
  factory :item do
    title {Faker::JapaneseMedia::DragonBall.character}
    description {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {2}
    condition_id {2}
    carriage_id {2}
    prefecture_id {2}
    ship_day_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
