class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :amount, presence: true

  enum :status, {
    pending: 0,
    approved: 1
  }
end
