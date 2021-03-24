class UsersController < ApplicationController
  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :family_name, :first_name, :kana_family_name, :kana_first_name, :birthday).merge(user_id current_user.id)
  end
end
