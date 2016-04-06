class UserMailer < ApplicationMailer
  def pairing_email(recipient, partner)
    @recipient = recipient
    @partner = partner
    mail(to: recipient.email, subject: "Have a coffee with #{partner.full_name} from #{partner.department.name}")
  end
end
