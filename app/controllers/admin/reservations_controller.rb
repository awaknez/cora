class Admin::ReservationsController < ApplicationController
  before_action :if_not_admin

  def index
    @reservations = Reservation.all.order(date: "ASC" ,time: "ASC")
        #  binding.pry
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @date_parse = @reservation.date.strftime("%Y年%m月%d日")
    @time = @reservation.time
    if (reservation_params[:style_id].to_i == @reservation.style_id) && (reservation_params[:number_of_people_id].to_i == @reservation.number_of_people_id)
      flash.now[:danger] = "ご参加予定人数もしくは面談形式を変更してください。"
      render action: :edit
    else
      @reservation.update(reservation_params)
      # ReservationMailer.sendmail_when_edit(@reservation).deliver
      redirect_to admin_reservation_path(@reservation)
    end
  end
  
  def destroy
    reservation = Reservation.find(params[:id])
    # ReservationMailer.sendmail_when_delete(reservation).deliver
    reservation.destroy
    flash[:success] = "予約を削除しました。"
    redirect_to admin_reservations_path
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:date,:time,:start_time,:style_id,:number_of_people_id,:question).merge(user_id:current_user.id)
    end

    def if_not_admin
      redirect_to root_path unless current_user.admin?
    end
end
