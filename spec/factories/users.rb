FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
  factory :user do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Johnny'
    last_name 'Snow'
    phone '4654654322'
  end
  factory :second_user, class: "AdminUser" do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'SecondAdmin'
    last_name 'User'
    phone '4654654328'
  end
  factory :admin_user, class: "AdminUser" do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Admin'
    last_name 'User'
    phone '4654654326'
  end
  factory :non_authorized_user, class: 'User' do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Second'
    last_name 'User'
    phone '4654654324'
  end
end
