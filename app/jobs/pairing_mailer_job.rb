class PairingMailerJob 
  include SuckerPunch::Job
  
  def perform(pairing)
    # Mark the pairing
    pairing.update_columns(emails_sent_at: Time.now)

    # Send the emails
    UserMailer.pairing_email(pairing.user_1, pairing.user_2).deliver
    UserMailer.pairing_email(pairing.user_2, pairing.user_1).deliver
  end
end
