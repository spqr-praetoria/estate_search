FactoryBot.define do
  factory :answer do
    question { nil }
    lawyer { nil }
    body { "MyText" }
    proposed_fee { 1 }
    is_paid { false }
  end
end
