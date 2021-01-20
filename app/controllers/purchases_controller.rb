class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    binding.pry
    
    @purchase_address = PurchaseAddress.new(purchase_params)
    
      if @purchase_address.valid?
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
end
