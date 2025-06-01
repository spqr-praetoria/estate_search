class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :amount, presence: true

  enum :status, {
    unpaid: 0,
    pending: 1,
    approved: 2,
    rejected: 3
  }
end
