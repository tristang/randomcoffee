class Pairing < ActiveRecord::Base
  belongs_to :meetup

  belongs_to :user_1, class_name: 'User'
  belongs_to :user_2, class_name: 'User'
end
