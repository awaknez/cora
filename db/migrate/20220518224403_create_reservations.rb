class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date        :date,                null:false
      t.string      :time,                null:false
      t.datetime    :start_time,          null:false
      t.integer     :style_id,            null:false
      t.integer     :number_of_people_id, null:false
      t.text        :question
      t.references  :user,                fareign_key:true
      t.timestamps
    end
  end
end
