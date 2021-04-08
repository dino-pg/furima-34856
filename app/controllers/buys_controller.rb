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
    @buy_shipping_address = BuyShippingAddress.new(shippingaddresses_params)
    @item = Item.find(params[:item_id])
    if @buy_shipping_address.valid?
      @buy_shipping_address.save
    redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_shipping_address).permit(:user_id, :item_id).merge(token: params[:token])
  end

  def shippingaddresses_params
    params.require(:buy_shipping_address).permit(:postal_code, :prefectures_id, :municipality, :address, :phone_number).merge(item_id: @item, user_id: current_user.id)
  end
end
