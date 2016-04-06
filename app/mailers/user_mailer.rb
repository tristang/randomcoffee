class UserMailer < ApplicationMailer
  def pairing_email
    mail(to: "afountis@gmail.com", subject: "This month Random Acts of Coffee")
  end
end
