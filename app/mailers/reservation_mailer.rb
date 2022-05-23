class ReservationMailer < ApplicationMailer
  def sendmail_when_reserve(reservation)
    @reservation = reservation
    mail(
      from: Rails.application.credentials.gmail[:address],
      to:   reservation.email,
      subject: 'お申し込みを受付けました'
    )
  end
end
