class Lawyer::PaymentsController < Lawyer::ApplicationController
  before_action :set_payment, only: %i[ show edit create update destroy ]

  def index
    @payments = current_user.payments.all
  end

  def show
  end

  def edit
  end

  def create
    current_user.payments.create(payment_params)
    redirect_to lawyer_payments_path, notice: "Payment created"
  end

  def update
    @payment.update(payment_params)
    redirect_to lawyer_payments_path, notice: "Payment updated"
  end

  def destroy
    @payment.destroy
    redirect_to lawyer_payments_path, notice: "Payment deleted"
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.expect(payment: [ :amount, :status, :answer_id, :user_id ])
  end
end
