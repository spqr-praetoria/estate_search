FactoryBot.define do
  factory :answer do
    question { association :question }
    lawyer { association :user, :lawyer }
    body { "MyText" }
    proposed_fee { 1 }
    status { :unpaid }
  end
end
