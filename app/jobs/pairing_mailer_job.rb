class PairingMailerJob 
  include SuckerPunch::Job

  def perform(pairing)
    # Don't send if alreayd sent. This is necessarry on second attemps when there
    # was a problem on the first attempt.
    return if pairing.emails_sent_at.present?

    # Mark the pairing
    pairing.update_columns(emails_sent_at: Time.now)

    # Send the emails
    UserMailer.pairing_email(pairing.user_1, pairing.user_2).deliver
    UserMailer.pairing_email(pairing.user_2, pairing.user_1).deliver
  end
end
