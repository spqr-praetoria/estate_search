class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :lawyer, class_name: "User"

  has_one :payment, dependent: :destroy

  validates :body, :proposed_fee, presence: true

  has_rich_text :body

  # after_create_commit do
  #   question.update(status: :answered)
  #   Payment.create(user_id: lawyer_id, answer: self, amount: proposed_fee)
  # end

  enum :status, {
    unpaid: 0,
    paid: 1
  }
end
