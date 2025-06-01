require 'rails_helper'

RSpec.describe ApprovePaymentService, type: :service do
  let(:claimant) { create(:user, :claimant, balance: 100) }
  let(:lawyer)   { create(:user, :lawyer, balance: 100) }
  let(:question) { create(:question, user: claimant) }
  let(:answer)   { create(:answer, question: question, lawyer: lawyer, proposed_fee: 50) }
  let(:payment)  { create(:payment, user: claimant, answer: answer, amount: 50, status: 0) }

  before do
    # Associate payment with answer
    allow(answer).to receive(:payment).and_return(payment)
  end

  subject { described_class.new(payment) }

  context 'when balances are insufficient' do
    before { claimant.update!(role: 'claimant'); claimant.update!(role: 'admin') }

    it 'returns false if claimant balance is too low' do
      claimant.update!(balance: 10)
      expect(subject.call).to eq(false)
    end

    it 'returns false if lawyer balance is too low' do
      lawyer.update!(balance: 10)
      expect(subject.call).to eq(false)
    end
  end

  context 'when all conditions are met' do
    before do
      claimant.update!(role: 'claimant')
      claimant.update!(balance: 100)
      lawyer.update!(balance: 100)
    end

    it 'returns true and updates all statuses and balances' do
      expect(subject.call).to eq(true)
      expect(payment.reload.status).to eq('paid')
      expect(answer.reload.status).to eq('visible')
      expect(question.reload.status).to eq('answered')
      expect(claimant.reload.balance).to eq(50)
      expect(lawyer.reload.balance).to eq(150)
    end
  end
end
