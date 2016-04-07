class UserMailer < ApplicationMailer
  def pairing_email(recipient, partner)
    @recipient = recipient
    @partner = partner
    mail(to: recipient.email, subject: "Have a coffee with #{partner.full_name} from #{partner.department.name}")
  end

  def test_email(email)
    mail(to: email, subject: "This was from Mailgbun")
  end
end
