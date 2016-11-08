# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@user = User.create(email: 'john@snow.com',
          password: 'asdfasdf',password_confirmation: 'asdfasdf',
          first_name: 'John', last_name: 'Snow')
puts '1 User created'
@admin_user = AdminUser.create(email: 'admin@test.com',
          password: 'asdfasdf',password_confirmation: 'asdfasdf',
          first_name: 'Admin', last_name: 'User')
puts '1 AdminUser created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end
puts '100 posts have been created'

