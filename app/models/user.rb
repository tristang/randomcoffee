class User < ActiveRecord::Base
  belongs_to :department

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :department, presence: true

  scope :active, -> { where(inactive: false) }
  scope :inactive, -> { where(inactive: true) }

  def full_name
    first_name + " " + last_name
  end

  def mailbox
    if self.email
      return self.email.gsub('@boroondara.vic.gov.au', '')
    end
  end

  def mailbox=(mailbox_name)
    if mailbox_name.present?
      self.email = mailbox_name + "@boroondara.vic.gov.au"
    else
      self.email = nil
    end
  end
end
