class ApplicationMailer < ActionMailer::Base
  default from: "Innovation and Business Transformation <postmaster@app3c3d8ad576534e8d8f6d4f45fb220a66.mailgun.org>"
  default reply_to: "Innovation and Business Transformation <boroondara.innovation@boroondara.vic.gov.au>"
  layout 'mailer'
end
