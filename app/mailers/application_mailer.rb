# frozen_string_literal:true

# Base Mmailer class
class ApplicationMailer < ActionMailer::Base
  default from: 'eeukst@gmail.com'
  layout 'mailer'
end
