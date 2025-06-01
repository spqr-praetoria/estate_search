FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    first_name { "John" }
    last_name { "Doe" }
    role { "claimant" }

    trait :claimant do
      role { "claimant" }
    end

    trait :admin do
      role { "admin" }
    end

    trait :lawyer do
      role { "lawyer" }
    end
  end
end
