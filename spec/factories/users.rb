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
    ssn 3456
    company 'IT'
  end
  factory :second_user, class: "AdminUser" do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'SecondAdmin'
    last_name 'User'
    phone '4654654328'
    ssn 3456
    company 'IT'
  end
  factory :admin_user, class: "AdminUser" do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Admin'
    last_name 'User'
    phone '4654654326'
    ssn 3456
    company 'IT'
  end
  factory :non_authorized_user, class: 'User' do
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Second'
    last_name 'User'
    phone '4654654324'
    ssn 3456
    company 'IT'
  end
end
