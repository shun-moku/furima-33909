class OrderAddress
  Address
  include ActiveModel::Model
  attr_accessor :zip_code, :city, :street_number, :building, :phone_number, :user_id, :item_id, :token, :region_id, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street_number
    validates :phone_number
    validates :token
  end
  validates :region_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(zip_code: zip_code, region_id: region_id, city: city, street_number: street_number, building: building,
                   order_id: order.id)
  end
end
