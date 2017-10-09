class ApplicationMailer < ActionMailer::Base
  default from: "People Culture & Development <postmaster@mg.randomacts.coffee>"
  default reply_to: "People Culture & Development <people.culture.development@boroondara.vic.gov.au>"
  layout 'mailer'
end
