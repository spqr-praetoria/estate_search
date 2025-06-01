require 'rails_helper'

RSpec.describe "Claimant::Payments", type: :request do
  let!(:claimant) { create(:user, :claimant) }
  let!(:lawyer)   { create(:user, :lawyer) }
  let!(:question) { create(:question, user: claimant) }
  let!(:answer)   { create(:answer, question: question, lawyer: lawyer) }
  let(:payment)  { create(:payment, user: claimant, answer: answer, amount: 50, status: 0) }

  before do
    sign_in claimant
  end

  describe "PATCH /claimant/payments/:id" do
    context "when payment approval succeeds" do
      it "responds with turbo_stream" do
        allow_any_instance_of(ApprovePaymentService).to receive(:call).and_return(true)
        patch claimant_payment_path(payment), headers: { 'ACCEPT' => 'text/vnd.turbo-stream.html' }
        expect(response.media_type).to eq('text/vnd.turbo-stream.html')
        expect(response).to have_http_status(:ok)
      end
    end

    context "when payment approval fails" do
      it "renders :edit with unprocessable_entity status" do
        allow_any_instance_of(ApprovePaymentService).to receive(:call).and_return(false)
        patch claimant_payment_path(payment)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
