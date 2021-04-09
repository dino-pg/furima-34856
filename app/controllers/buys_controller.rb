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
      pay_item
      @buy_shipping_address.save
    redirect_to root_path
    else
      render :index
    end
  end

  private

  # def buy_params
  #   params.require(:buy_shipping_address).permit(:user_id, :item_id).merge(token: params[:token])
  # end

  def shippingaddresses_params
    params.require(:buy_shipping_address).permit(:postal_code, :prefectures_id, :municipality, :address, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shippingaddresses_params[:token],
      currency: 'jpy'
    )
  end

end
