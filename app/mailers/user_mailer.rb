class UserMailer < ApplicationMailer
  def pairing_email(recipient, partner)
    @recipient = recipient
    @partner = partner
    mail(to: recipient.email, subject: "Meet up with #{partner.full_name} from #{partner.department.name}!")
  end

  def test_email(email)
    mail(to: email, subject: "This was from Mailgun")
  end
end
