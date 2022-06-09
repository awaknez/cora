class UsersController < ApplicationController
  def show
    if params[:id].to_i != current_user.id
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @user_name = "#{(@user.name_last_name)+(@user.name_first_name)}"
      @reservations = @user.reservations.order(date: "ASC" ,time: "ASC")
    end
  end

end
