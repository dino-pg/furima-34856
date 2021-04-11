class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy, only: [:index, :create]
  before_action :item_user, only: [:index, :create]

  def index
    @buy_shipping_address = BuyShippingAddress.new
  end

  def create
    @buy_shipping_address = BuyShippingAddress.new(shippingaddresses_params)
    if @buy_shipping_address.valid?
      pay_item
      @buy_shipping_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def shippingaddresses_params
    params.require(:buy_shipping_address).permit(:postal_code, :prefectures_id, :municipality, :address, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: shippingaddresses_params[:token],
      currency: 'jpy'
    )
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end

  def item_user
      redirect_to root_path if current_user.id == @item.user.id || @item.purchace.present?
    end
  end

end
