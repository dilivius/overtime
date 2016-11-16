namespace :notification do
  desc "Sends reminder SMS notifications to users"
  task sms: :environment do
    if Time.now.wednesday?
      employees = Employee.all
      notification_message = "Please log into the Overtime management dashboard to request overtime or confirm your hours for last week: http://morning-overtime-2016.herokuapp.com/"
      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    end
  end

  desc "Sends email notifications to admin_users/managers each day to inform of pending overtime requests"
  task manager_email: :environment do
    # 1. Iterate over the list of pending overtime requests
    # 2. Check to see if there are any requests
    # 3. Iterate over the list of admin_users/managers
    # 4. Send email to each admin_user/manager.
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if (submitted_posts.count > 0)
      admin_users.each do |admin|
        ManagerMailer.requests_email(admin).deliver_later
      end
    end
  end

end
