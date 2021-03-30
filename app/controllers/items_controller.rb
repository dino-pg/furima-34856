class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # def index
  #   @users = User.all
  # end

  def new
   @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def  item_params
    params.require(:item).permit(:nickname, :image, :text)
  end
end
