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
    #
    #
    # number: '233413432'
    # No spaces or dashes
    # Length max 10 chars
    # All characters must be a number
  end

end
