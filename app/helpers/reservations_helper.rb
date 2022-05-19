module ReservationsHelper
   def time_schedule
    time_schedules =[
                    "13:00",
                    "13:30",
                    "14:00",
                    "14:30",
                    "15:00",
                    "15:30",
                    "16:00",
                    "16:30",
                    "17:00",
                    "17:30",
                    "18:00" ]
   end

  

  #  def check_reservation(reservations, date, time)
  #   result = false
  #   reservations_count = reservations.count
  #   # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
  #   if reservations_count >= 1
  #     reservations.each do |reservation|
  #       result = reservation[:date].eql?(date.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
  #       return result if result
  #     end
  #   end
  #   return result
  # end

end
