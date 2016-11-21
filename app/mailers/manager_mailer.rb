class ManagerMailer < ApplicationMailer
  def requests_email(manager)
    @manager = manager
    mail(to: manager.email, subject: 'Daily hours report')
  end
end
