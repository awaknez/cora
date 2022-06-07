class ReservationsController < ApplicationController
  before_action :authenticate_user! ,only: [:index,:new]
  # before_action :set_beginning_of_week,only: [:index]
  before_action :if_admin,only:[:index]

  def index
    @reservations = Reservation.all.order(date: "ASC" ,time: "ASC")
  end

  def new
    @reservation = Reservation.new
    @date = params[:date]
    @time = params[:time]
    @date_wday = Date.strptime(@date, '%Y-%m-%d').wday
    @start_time = DateTime.parse(@date + " " + "JST")
    @student_name = (current_user.name_last_name) + " " + (current_user.name_first_name)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @date_parse = @reservation.date.strftime("%Y年%m月%d日")
    @time = @reservation.time
    # render先で日付を表示させるために必要
    @date = @reservation.date
      # redirect_to root_path
      # ReservationMailer.sendmail_when_reserve(@reservation).deliver
    if params[:back] || !@reservation.save
      redirect_to root_path
      # render :new and return
    # else
      # redirect_to user_path(current_user.id)
    end
    # プライベートメソッドの呼び出し
    gcalendar_forcreate
  end

  def show
    # 下記条件分岐でconfirm画面でリロードした際にトップページへ戻す設定
    if params[:id] == "confirm"
      redirect_to root_path
    else
      @reservation = Reservation.find(params[:id])
      gcalendar_forshow
    end
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
    elsif  @reservation.update(reservation_params)
      # ReservationMailer.sendmail_when_edit(@reservation).deliver
    else  
      flash.now[:alert] = "変更ができませんでした。"
      render :edit
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    ReservationMailer.sendmail_when_delete(reservation).deliver
    reservation.destroy
    flash[:success] = "予約を削除しました。"
    redirect_to user_path(reservation.user_id)
  end 

  def confirm
      @reservation = Reservation.new(reservation_params)
      # binding.pry

      if @reservation.invalid?
      # @date = @reservation.date
      redirect_to root_path
    # render :new
      end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date,:time,:start_time,:style_id,:number_of_people_id,:question).merge(user_id:current_user.id)
  end

  # def set_beginning_of_week
  #   Date.beginning_of_week = :sunday
  # end

  def if_admin
    if current_user.admin?
      redirect_to admin_reservations_path 
    end
  end

  # googleCalendar登録用メソッド
  def gcalendar_forcreate
    date_convert = @reservation.start_time
    date_convert2 = date_convert-18.hour
    calendar_parse_begin = date_convert2.strftime("%Y%m%d")+"T"+date_convert2.strftime("%H%M%S")+"Z"
    end_time = date_convert2 + 1.hour
    calendar_parse_end = end_time.strftime("%Y%m%d")+"T"+end_time.strftime("%H%M%S")+"Z"
    @calendar_url = 'http://www.google.com/calendar/event?action=TEMPLATE' +
    '&text=面談' + '&details='+ "#{@reservation.question}" + 
    '&dates=' + "#{calendar_parse_begin}" + '/' + "#{calendar_parse_end}" + 
    '&location=&trp=undefined&trp=true&sprop='
  end

  def gcalendar_forshow
    date_convert = @reservation.start_time
    date_convert3 = date_convert-9.hour
    calendar_parse_begin = date_convert3.strftime("%Y%m%d")+"T"+date_convert3.strftime("%H%M%S")+"Z"
    end_time = date_convert3 + 1.hour
    calendar_parse_end = end_time.strftime("%Y%m%d")+"T"+end_time.strftime("%H%M%S")+"Z"
    @calendar_url = 'http://www.google.com/calendar/event?action=TEMPLATE' +
    '&text=面談' + '&details='+ "#{@reservation.question}" + 
    '&dates=' + "#{calendar_parse_begin}" + '/' + "#{calendar_parse_end}" + 
    '&location=&trp=undefined&trp=true&sprop='
  end

end
