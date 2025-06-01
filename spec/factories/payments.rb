FactoryBot.define do
  factory :payment do
    user { nil }
    answer { nil }
    amount { 1 }
    status { :approved }
    approved_at { "2025-05-29 09:52:58" }
  end
end
