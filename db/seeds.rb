# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@user = User.create(email: 'john@snow.com',
          password: 'asdfasdf',password_confirmation: 'asdfasdf',
          first_name: 'John', last_name: 'Snow', phone: '012345678')
puts '1 User created'
@admin_user = AdminUser.create(email: 'admin@test.com',
          password: 'asdfasdf',password_confirmation: 'asdfasdf',
          first_name: 'Admin', last_name: 'User', phone: '012385678')
puts '1 AdminUser created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end
puts '100 posts have been created'

