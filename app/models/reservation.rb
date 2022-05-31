class Reservation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :number_of_people
  belongs_to :style
  belongs_to :user

  with_options presence: true do
    validates :date  
    validates :time   ,format: { with:/\A[\d]{2}:[\d]{2}\z/} #半角数字で時間を表現
    # validates :start_time
    validates :style_id,             numericality: { other_than: 1 ,message: "を選んでください"}
    validates :number_of_people_id,  numericality: { other_than: 1 ,message: "を選んでください"}
  end

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
