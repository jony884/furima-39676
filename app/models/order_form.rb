class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_origin_id, :city, :street_address, :building_address, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_origin_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :token, presence: true
  end

  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, street_address: street_address, building_address: building_address, phone_number: phone_number, order_id: order.id)
  end

end