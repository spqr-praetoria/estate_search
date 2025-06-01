class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :amount, presence: true

  enum :status, {
    unpaid: 0,
    paid: 1
  }
end
