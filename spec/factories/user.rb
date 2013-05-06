FactoryGirl.define do
  factory :user, class: User do
    username "quan"
    password "123456"
    email "user@example.com"
  end
end