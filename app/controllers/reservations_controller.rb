class ReservationsController < ApplicationController
  before_action :authenticate_user! ,only: [:index,:new]
  # before_action :set_beginning_of_week,only: [:index]

  def index
    @reservations = Reservation.all.order(date: "ASC" ,time: "ASC")
        #  binding.pry
  end

   def new
     @reservation = Reservation.new
     @date = params[:date]
     @time = params[:time]
     @date_wday = Date.strptime(@date, '%Y-%m-%d').wday
     @start_time = DateTime.parse(@date + " " + @time + " " +"JST")
   end

  def create
    @reservation = Reservation.new(reservation_params)
    @date_parse = @reservation.date.strftime("%Y年%m月%d日")
    @time = @reservation.time
    ReservationMailer.sendmail_when_reserve(@reservation).deliver
    unless @reservation.save
      # redirect_to root_path
      # reservation_path(@reservation.id)
      render :new
    end
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
    render :edit
  else
    @reservation.update(reservation_params)
    ReservationMailer.sendmail_when_edit(@reservation).deliver
  end
 end

 def destroy
  reservation = Reservation.find(params[:id])
  ReservationMailer.sendmail_when_delete(reservation).deliver
  reservation.destroy
  flash[:success] = "予約を削除しました。"
  redirect_to user_path(reservation.user_id)
 end

  private
  def reservation_params
    params.require(:reservation).permit(:date,:time,:start_time,:style_id,:number_of_people_id,:question).merge(user_id:current_user.id)
  end

  # def set_beginning_of_week
  #   Date.beginning_of_week = :sunday
  # end

end
