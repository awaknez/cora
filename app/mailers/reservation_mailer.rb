class ReservationMailer < ApplicationMailer

  def sendmail_when_reserve(reservation)
    @reservation = reservation
    mail(
      from: Rails.application.credentials.gmail[:address],
      to:   @reservation.user.email,
      subject: 'お申し込みを受付けました'
    )
  end

  def sendmail_when_edit(reservation)
    @reservation = reservation
    mail(
      from: Rails.application.credentials.gmail[:address],
      to:   @reservation.user.email,
      subject: 'お申し込みの変更を受付けました'
    )
  end

  def sendmail_when_delete(reservation)
    @reservation = reservation
    mail(
      from: Rails.application.credentials.gmail[:address],
      to:   @reservation.user.email,
      subject: '申込みの取り消しがありました'
    )
  end
end
