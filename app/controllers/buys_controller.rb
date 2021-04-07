class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @buy_shipping_address = BuyShippingAddress.new
  end

  def new
    @buy_shipping_address = BuyShippingAddress.new
  end

  def create
    @buy_shipping_address = BuyShippingAddress.new(buy_params)
    if @buy_shipping_address.valid?
      @buy_shipping_address.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:user, :item)
  end
end
