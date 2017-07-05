FactoryGirl.define do
  factory :user, class: User do
    email "test@test.com"
    username  "test_user"
    password "test123"
  end

  factory :admin, class: User do
    email "admin@test.com"
    username  "admin_user"
    password "admin123"
    admin true
  end

end
