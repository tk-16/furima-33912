require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    
    context '購入ができる時' do
      it 'token,user_id, item_id,post_cord,delivery_area_id,municipalities,address,:telephone,:purchaseが存在すれば登録できること' do
        expect(@purchase_address).to be_valid
      end

      it "buildingが空でも登録できる" do
        @purchase_address.building = ""
        expect(@purchase_address).to be_valid
      end
    end
    context '購入ができない時' do
      it 'post_cordが空では登録できないこと' do
        @purchase_address.post_cord = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post cord can't be blank")
      end

      it 'municipalitiesが空では登録できないこと' do
        @purchase_address.municipalities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephoneが空では登録できないこと' do
        @purchase_address.telephone = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'post_cordがハイフンを含んでいないと登録できないこと' do
        @purchase_address.post_cord = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post cord Input correctly")
      end

      it 'telephoneが11桁以内の数値出ないと登録できないこと' do
        @purchase_address.telephone = "012345678910"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone Input only number")
      end
      
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できないこと" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できないこと" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'delivery_area_idが1では登録できないこと' do
        @purchase_address.delivery_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Delivery area Select")
      end

      it 'telephoneが英数混合では登録できないこと' do
        @purchase_address.telephone = "012345aaaaaa"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone Input only number")
      end

    end
  end
end
