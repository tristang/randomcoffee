class MeetupMailerJob < ActiveJob::Base
  queue_as :default

  def perform(meetup)
    meetup.pairings.each do |pairing|
      UserMailer.pairing_email(pairing.user_1, pairing.user_2).deliver_later
      UserMailer.pairing_email(pairing.user_2, pairing.user_1).deliver_later
    end
  end
end
