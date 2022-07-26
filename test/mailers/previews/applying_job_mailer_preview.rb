# Preview all emails at http://localhost:3000/rails/mailers/applying_job_mailer
class ApplyingJobMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applying_job_mailer/apply
  def apply
    ApplyingJobMailer.apply
  end

  # Preview this email at http://localhost:3000/rails/mailers/applying_job_mailer/cancel
  def cancel
    ApplyingJobMailer.cancel
  end

end
