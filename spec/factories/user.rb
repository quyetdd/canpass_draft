FactoryGirl.define do
  factory :user, class: User do
    username "something"
    password "123456"
    email "user@example.com"
    role_id 1
  end
end