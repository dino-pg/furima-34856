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
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
