class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 

  # def index
  #   @users = User.all
  # end

end
