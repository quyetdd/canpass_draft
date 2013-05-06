class UserMailer < ActionMailer::Base
  default :from => Settings.mailer.default_from
end
