class Claimant::PaymentsController < Claimant::ApplicationController
  before_action :set_payment, only: :update

  def update
    if ApprovePaymentService.new(@payment).call
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @payment, notice: "Payment was successfully updated.", status: :see_other }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_payment
    @payment = Payment.find(params.expect(:id))
  end

  def payment_params
    params.expect(payment: [ :user_id, :answer_id, :amount, :status, :approved_at ])
  end
end
