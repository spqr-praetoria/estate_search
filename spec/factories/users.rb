FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    first_name { "John" }
    last_name { "Doe" }
    role { "user" }
  end
end
