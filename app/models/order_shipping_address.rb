class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code,:city,:addresses,:building,:phone_number,:prefecture_id

  VALID_INTEGER_REGEX = /[0-9]{10,11}/i.freeze
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :addresses
    validates :phone_number, format: {with:/[0-9]{10,11}/, message: "is invalid. Phone number must be integer and only 10 or 11  digit"}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :token
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,addresses: addresses, building: building,phone_number: phone_number, order_id: order.id)
  end
end