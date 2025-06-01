FactoryBot.define do
  factory :question do
    user { nil }
    title { "MyString" }
    body { "MyText" }
    category { "MyString" }
    status { 1 }
  end
end
