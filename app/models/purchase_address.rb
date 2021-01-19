class UserPurchase
  include ActiveModel::Model
  attr_accesssor :user_id, :item_id,:post_cord,:delivery_area_id,:municipalities,:address,:building,:telephone,:purchase

  
  with_options presence: true do
    validates :post_cord
    validates :delivery_area_id
    validates :municipalities
    validates :address
    validates :telephone
  end

  validates :delivery_area_id,numericality: { other_than: 1 , message: 'Select'} do

    def save
      Purchase.create(user_id: user_id,item_id: item_id)
      Address.create(post_cord: post_cord,delivery_area_id: delivery_area_id,municipalities: municipalities,address: address,building: building,telephone: telephone,purchase: purchase)
    end

end