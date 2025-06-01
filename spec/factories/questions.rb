FactoryBot.define do
  factory :question do
    user { create(:user, :claimant) }
    title { "MyString" }
    body { "MyText" }
    category { 0 }
    status { 1 }
  end
end
