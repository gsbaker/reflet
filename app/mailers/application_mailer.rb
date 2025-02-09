class ApplicationMailer < ActionMailer::Base
  default from: "notifications@reflet.io"
  layout "mailer"
end
