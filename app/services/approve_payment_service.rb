class ApprovePaymentService
  attr_reader :payment

  def initialize(payment)
    @payment = payment
  end

  def call
    return false if !user.claimant?
    return false if question.user.balance < answer.proposed_fee

    ActiveRecord::Base.transaction do
      update_payment_status
      update_answer_status
      update_question_status
      process_payment_transfer
    end

    payment.approved? && answer.paid? && question.answered?
  end

  private

  def question
    @question ||= answer.question
  end

  def answer
    @answer ||= payment.answer
  end

  def user
    @user ||= question.user
  end

  def update_payment_status
    payment.update!(status: :approved)
  end

  def update_answer_status
    answer.update!(status: :paid)
  end

  def update_question_status
    question.update!(status: :answered)
  end

  def process_payment_transfer
    transfer_fee_to_lawyer
    charge_fee_to_claimant
  end

  def transfer_fee_to_lawyer
    lawyer = answer.lawyer
    lawyer.update!(balance: lawyer.balance + answer.proposed_fee)
  end

  def charge_fee_to_claimant
    claimant = question.user
    claimant.update!(balance: claimant.balance - answer.proposed_fee)
  end
end
