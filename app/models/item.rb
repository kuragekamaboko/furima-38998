class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery
  belongs_to :prefecture

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :sales_status_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true,numericality: { only_integer: true ,greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  validates :scheduled_delivery_id, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

end
