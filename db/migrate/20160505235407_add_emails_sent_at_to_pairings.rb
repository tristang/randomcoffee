class AddEmailsSentAtToPairings < ActiveRecord::Migration
  def change
    add_column :pairings, :emails_sent_at, :datetime

    Pairing.reset_column_information

    Meetup.where.not(emails_sent_at: nil).each do |meetup|
      meetup.pairings.update_all(emails_sent_at: meetup.emails_sent_at)
    end
  end
end
