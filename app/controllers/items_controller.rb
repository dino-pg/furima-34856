class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order('created_at DESC')
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :condition_id, :category_id, :charge_id, :area_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
