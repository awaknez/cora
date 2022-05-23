# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
  def sendmail_when_reserve_preview
    reservation = Reservation.find(3)
    ReservationMailer.sendmail_when_reserve(reservation)
  end
end
