class OrderHistory
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building, :phone, :price, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone
    validates :user_id
    validates :item_id
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    history = History.create( item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
   Order.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone: phone, history_id: history.id)

  end

end