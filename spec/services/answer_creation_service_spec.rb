require 'rails_helper'

RSpec.describe AnswerCreationService, type: :service do
  let(:question) { create(:question, status: :open) }
  let(:lawyer) { create(:user, :lawyer) }
  let(:answer) { create(:answer, question: question, lawyer: lawyer, proposed_fee: 100) }
  let(:service) { described_class.new(answer) }

  describe '#call' do
    it 'updates question status to answered' do
      service.call
      expect(question.reload.status).to eq('answered')
    end

    it 'creates a payment record' do
      expect { service.call }.to change(Payment, :count).by(1)
    end

    it 'creates payment with correct attributes' do
      service.call
      payment = Payment.last
      expect(payment.user).to eq(lawyer)
      expect(payment.answer).to eq(answer)
      expect(payment.amount).to eq(100)
    end

    context 'when question update fails' do
      before do
        allow_any_instance_of(Question).to receive(:update!).and_raise(ActiveRecord::RecordInvalid.new(question))
      end

      it 'raises an error' do
        expect { service.call }.to raise_error(AnswerCreationService::Error)
      end

      it 'does not create a payment' do
        expect {
          service.call rescue AnswerCreationService::Error
        }.not_to change(Payment, :count)
      end
    end

    context 'when payment creation fails' do
      before do
        allow(Payment).to receive(:create!).and_raise(ActiveRecord::RecordInvalid.new(Payment.new))
      end

      it 'raises an error' do
        expect { service.call }.to raise_error(AnswerCreationService::Error)
      end

      it 'rolls back the question status update' do
        expect {
          service.call rescue AnswerCreationService::Error
        }.not_to change { question.reload.status }
      end
    end
  end
end
