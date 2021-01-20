class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    
      if @purchase_address.valid?
        pay_item
        @purchase_address.save
        redirect_to root_path
      else
        render action: :index
      end

  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_cord,:delivery_area_id,:municipalities,:address,:building,:telephone,:purchase).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])

  end

  def pay_item
    binding.pry
    
    Payjp.api_key = "sk_test_bf56b59cbf4f16335a07b699"   
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token], 
      currency: 'jpy'          
    )
  end
end
