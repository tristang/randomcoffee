class ApplicationMailer < ActionMailer::Base
  default from: "Innovation and Business Transformation <postmaster@mg.randomacts.coffee>"
  default reply_to: "Innovation and Business Transformation <boroondara.innovation@boroondara.vic.gov.au>"
  layout 'mailer'
end
