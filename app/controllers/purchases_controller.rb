class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAdress.new
  end
end
