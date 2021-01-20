require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
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
      

    end
  end
end
