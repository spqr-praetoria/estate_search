class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :lawyer, class_name: "User"

  has_one :payment, dependent: :destroy

  validates :body, :proposed_fee, presence: true
  validates :proposed_fee, numericality: { greater_than: 0 }

  enum :status, {
    hidden: 0,
    visible: 1
  }
end
