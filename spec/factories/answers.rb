FactoryBot.define do
  factory :answer do
    question { nil }
    lawyer { nil }
    body { "MyText" }
    proposed_fee { 1 }
    status { :hidden }
  end
end
