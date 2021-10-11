class Order < ApplicationRecord
  belongs_to :history
  # attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # with_options presence: true do
  #   validates :token
  #   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  #   validates :city
  #   validates :block
  #   validates :phone
  # end

end
