namespace :notification do
  desc "Sends reminder SMS notifications to users"
  task sms: :environment do
    # 1. Schedule to run every Sunday at 4PM (ask employees to log if they have overtime or not)
    # 2. Iterate over all employees
    # 3. Skip Admin users
    # 4. Send a message that has instructions and a link to log time

    # User.all.each do |user|
    #   SmsTool.send_sms(number: , message: "")
    # end
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
