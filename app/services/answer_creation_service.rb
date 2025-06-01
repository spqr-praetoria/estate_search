class AnswerCreationService
  class Error < StandardError; end

  def initialize(answer)
    @answer = answer
  end

  def call
    ActiveRecord::Base.transaction do
      update_question_status
      create_payment
    end
  rescue StandardError => e
    Rails.logger.error("Failed to create answer: #{e.message}")
    raise Error, "Failed to process answer creation: #{e.message}"
  end

  private

  attr_reader :answer

  def update_question_status
    answer.question.update!(status: :answered)
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Failed to update question status: #{e.message}")
    raise Error, "Failed to update question status: #{e.message}"
  end

  def create_payment
    Payment.create!(
      user_id: answer.lawyer_id,
      answer: answer,
      amount: answer.proposed_fee
    )
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Failed to create payment: #{e.message}")
    raise Error, "Failed to create payment: #{e.message}"
  end
end
