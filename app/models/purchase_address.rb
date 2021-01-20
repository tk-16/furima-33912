class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token,:user_id, :item_id,:post_cord,:delivery_area_id,:municipalities,:address,:building,:telephone

  
  with_options presence: true do
    validates :post_cord,format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :delivery_area_id,numericality: { other_than: 1 , message: 'Select'} 
    validates :municipalities
    validates :address
    validates :telephone,format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token
    validates :user_id
    validates :item_id
  end

  

  def save
    purchase = Purchase.create(user_id: user_id,item_id: item_id)
    Address.create(post_cord: post_cord,delivery_area_id: delivery_area_id,municipalities: municipalities,address: address,building: building,telephone: telephone,purchase_id: purchase.id)
  end
end