class User < ActiveRecord::Base
  belongs_to :department

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :department, presence: true
end
