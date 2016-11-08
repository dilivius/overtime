FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "New Post1"
    user
  end
  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "New Post2"
    user
  end
  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "New Post3"
    non_authorized_user
  end
end
