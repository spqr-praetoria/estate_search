class Question < ApplicationRecord
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates :title, :body, presence: true

  enum :category, {
    general: 0,
    missing_assets: 1,
    wills_and_probate: 2,
    legal_heirship: 3
  }

  enum :status, {
    open: 0,
    answered: 1,
    closed: 2
  }
end
