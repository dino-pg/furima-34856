class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :family_name, :first_name, :kana_family_name, :kana_first_name, :birthday).merge(user_id current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
