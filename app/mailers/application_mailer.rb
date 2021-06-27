class ApplicationMailer < ActionMailer::Base
  default from: "MYOB Random Acts of Coffee <postmaster@mg.randomacts.coffee>"
  default reply_to: "Tas Fountis <tas@myob.com>"
  layout 'mailer'
end
