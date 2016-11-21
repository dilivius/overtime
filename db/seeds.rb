# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@admin_user = AdminUser.create!(email: 'admin@test.com',
          password: 'asdfasdf',password_confirmation: 'asdfasdf',
          first_name: 'Admin', last_name: 'User', phone: '0740167952', ssn: 1234, company: 'IT')
puts '1 AdminUser created'

@employee = Employee.create!(email: 'john@snow.com',
          password: 'asdfasdf',password_confirmation: 'asdfasdf',
          first_name: 'John', last_name: 'Snow', phone: '0740167952', ssn: 1234, company: 'IT')
puts "1 Employee created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @employee.id, hours: 12.5)
end
puts '100 posts have been created'


# 100.times do
#   AuditLog.create(user_id: @user.id, status: 0, start_date: (Date.today - 6.days), end_date: nil)
# end
# puts '100 audit_logs have been created'

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"

