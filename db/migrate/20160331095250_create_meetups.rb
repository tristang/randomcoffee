class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.datetime :emails_sent_at
      t.timestamps null: false
    end
  end
end
