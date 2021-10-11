FactoryBot.define do
  factory :order_history do
    association :user
    association :item
    post_code {'123-4567'}
    token {'hu1v13bj'}
    prefecture_id {2}
    city {'横浜'}
    block {'青柳'}
    phone {'09012345678'}
  end
end
