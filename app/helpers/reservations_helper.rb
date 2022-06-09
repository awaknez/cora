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
  #   # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    if reservations_count > 1
        reservations.each do |reservation|
          result = reservation[:date].eql?(day) && reservation[:time].eql?(time)
          return result if result
        end
    elsif reservations_count == 1
        result = reservations[0][:date].eql?(day) && reservations[0][:time].eql?(time)
        return result if result
      end
    return result
    end
end

# .strftime("%Y-%m-%d")

def check_reservation_monthly(reservations,day)
  # 第一引数にレコード、第二引数にカレンダーのdateの情報が入る
  # 新しい配列を定義
  result = false
  reservations_count_formonth = []
  # 条件に当てはまるものを配列に追加
  # reservation = reservations.where(start_time:day+"22:00"..(day+1)+"04:00")
  # reservations_count_formonth << reservation

  reservations.each do |reservation|
    if reservation.date.eql?(day)
      reservations_count_formonth << reservation
    end
  end
  # 新しい配列の要素の数がtime_schedulesの要素の数と一致していればtrueを代入
  if reservations_count_formonth.count == 11
    result = true
  end
  # binding.pry
  # reservations.where(start_time:  "#{hoge}" .. "#{fuga}")
  # return result
end
