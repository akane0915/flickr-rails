FactoryGirl.define do
  factory :user, class: User do
    email "test@test.com"
    username  "test_user"
    password "test123"

    factory :user_with_images do
      transient do
        images_count 1
      end
      after(:create) do |user, evaluator|
        create_list(:image, evaluator.images_count, user: user)
      end
    end
  end

  factory :admin, class: User do
    email "admin@test.com"
    username  "admin_user"
    password "admin123"
    admin true
  end

  factory :image, class: Image do
    title "test title"
    picture { fixture_file_upload(Rails.root.join('spec', 'photos', 'rails.png'), 'image/png') }
    # association :user
  end


end
