require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(date time grade last_name first_name style number_of_people question)
  csv << csv_column_names
  @reservations.each do |reservation|
    csv_column_values = [
      reservation.date,
      reservation.time,
      reservation.user.grade.name,
      reservation.user.name_last_name,
      reservation.user.name_first_name,
      reservation.style.name,
      reservation.number_of_people.name,
      reservation.question
    ]
    csv << csv_column_values
  end
end