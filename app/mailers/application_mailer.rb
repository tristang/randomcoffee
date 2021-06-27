class ApplicationMailer < ActionMailer::Base
  default from: "MYOB Random acts of coffee <postmaster@mg.randomacts.coffee>"
  default reply_to: "Tas Fountis <tas@myob.com>"
  layout 'mailer'
end
