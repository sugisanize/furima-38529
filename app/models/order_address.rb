class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :address
    validates :telephone, format: { with: /\A[0-9]{10,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                   building_name: building_name, telephone: telephone, order_id: order.id)
  end
end
