class ReservationMailer < ApplicationMailer
  def sendmail_when_reserve(reservation)
    @reservation = reservation
    mail(
      from: 'zenz022021@gmail.com',
      to:   'jahn_jack9@yahoo.co.jp',
      subject: 'お申し込みを受付けました'
    )
  end
end
