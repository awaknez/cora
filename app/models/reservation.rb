class Reservation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :number_of_people
  belongs_to :style

  def self.reservations_after_three_month
    # 今日から3ヶ月先までのデータを取得
    # 下記の”date>=?”のdateはカラム名
    reservations = Reservation.all
    # .where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order("date DESC")
    # 配列を作成し、データを格納
    # DBアクセスを減らすために必要なデータを配列にデータを突っ込んでます
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(date: reservation.date.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
   end

end
