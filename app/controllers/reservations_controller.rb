class ReservationsController < ApplicationController
  before_action :authenticate_user! ,only: [:index,:new]

  def index
    @reservations = Reservation.all.order(date: "ASC" ,time: "ASC")
        #  binding.pry

  end

   def new
     @reservation = Reservation.new
     @date = params[:date]
     @time = params[:time]
     @start_time = DateTime.parse(@date + " " + @time + " " +"JST")
   end

  def create
    @reservation = Reservation.new(reservation_params)
    @date_parse = @reservation.date.strftime("%Y年%m月%d日")
    @time = @reservation.time
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
  unless @reservation.update(reservation_params)
    render :edit
  end
 end

 def destroy
  reservation = Reservation.find(params[:id])
  reservation.destroy
  redirect_to user_path(reservation.user_id)
 end

  private
  def reservation_params
    params.require(:reservation).permit(:date,:time,:start_time,:style_id,:number_of_people_id,:question).merge(user_id:current_user.id)
  end

end
