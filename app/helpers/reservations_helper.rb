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

  def check_reservation(reservations, day, time)
      result = false
      reservations_count = reservations.count
      # binding.pry
  #   # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
      if reservations_count > 1
         reservations.each do |reservation|
           result = reservation[:date].eql?(day) && reservation[:time].eql?(time)
          return result 
          # if result
         end
      elsif reservations_count == 1
        result = reservations[0][:date].eql?(day) && reservations[0][:time].eql?(time)
        # binding.pry

        return result 
        # if result
      end
     return result
   end

end

# .strftime("%Y-%m-%d")
