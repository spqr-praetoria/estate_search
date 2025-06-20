class Question < ApplicationRecord
  belongs_to :user

  has_many :answers, dependent: :destroy

  scope :not_closed, -> { where.not(status: :closed) }

  validates :title, :body, presence: true
  validates :status, inclusion: { in: %w[open answered closed] }
  validates :category, inclusion: { in: %w[general missing_assets wills_and_probate legal_heirship] }

  has_rich_text :body

  after_create_commit do
    broadcast_prepend_to "questions", partial: "claimant/questions/question", target: "questions-list"
    broadcast_prepend_to "lawyer_questions", partial: "lawyer/questions/question", target: "lawyer-questions-list"
  end

  after_update_commit do
    broadcast_replace_to "questions", partial: "claimant/questions/question"
    broadcast_replace_to "lawyer_questions", partial: "lawyer/questions/question"
  end

  after_destroy_commit do
    broadcast_remove_to "questions", partial: "claimant/questions/question"
    broadcast_remove_to "lawyer_questions", partial: "lawyer/questions/question"
  end

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

  def answered_by?(lawyer)
    answers.exists?(lawyer: lawyer)
  end
end
