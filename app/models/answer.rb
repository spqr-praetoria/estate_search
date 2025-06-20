class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :lawyer, class_name: "User"

  has_one :payment, dependent: :destroy

  validates :body, :proposed_fee, presence: true

  has_rich_text :body

  enum :status, {
    unpaid: 0,
    paid: 1
  }
end
