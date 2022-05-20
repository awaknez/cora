class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user_name = "#{(user.name_last_name)+(user.name_first_name)}"
    @reservations = user.reservations
  end

end
