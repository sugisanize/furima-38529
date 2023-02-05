class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true
  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :telephone, presence: true, format: { with: /[0-9]{10,11}/ }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                   building_name: building_name, telephone: telephone, order_id: order.id)
  end
end
