# frozen_string_literal:true

# class Apply mailer for sending mail 
class ApplyingJobMailer < ApplicationMailer
  def apply(job, user)
    @job = job
    @user = user
    @greeting = 'Hi'
    @full_name = "#{user.first_name} #{user.last_name}"
    subj = 'Recived New Application'
    mail to: @job.user.email, subject: subj
  end

  def cancel(job,user)
    @greeting = 'Hi'
    @job = job
    @user = user
    @greeting = 'Hi'
    @full_name = "#{user.first_name} #{user.last_name}"
    subj = 'Application Canceled'
    mail to: @job.user.email, subject: subj
  end
end
