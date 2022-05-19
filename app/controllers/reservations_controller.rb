class ReservationsController < ApplicationController
  before_action :authenticate_user! ,only: [:new]

  def index
    @reservations = Reservation.all
  end

   def new
     @reservation = Reservation.new
    #  binding.pry
     @date = params[:date]
     @time = params[:time]
     @start_time = DateTime.parse(@date + " " + @time + " " +"JST")
   end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to root_path
      # reservation_path(@reservation.id)
    else
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date,:time,:start_time,:style_id,:number_of_people_id,:question).merge(user_id:current_user.id)
  end

end
