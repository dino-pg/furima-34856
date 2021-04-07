class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:user, :item)
  end
end
