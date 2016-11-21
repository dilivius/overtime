FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "New Post1"
    hours 10.0
    user
  end
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "New Post2"
    hours 9.0
    user
  end
  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "New Post3"
    hours 8.5
    non_authorized_user
  end
end
