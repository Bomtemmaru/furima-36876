class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :carriage
  belongs_to :prefecture
  belongs_to :ship_day

with_options presence: true do
  validates :title
  validates :description
  validates :image
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
 with_options numericality: { other_than: 1, message: "can't be blank" } do
  validates :category_id
  validates :condition_id
  validates :carriage_id
  validates :prefecture_id
  validates :ship_day_id
 end
end
end
