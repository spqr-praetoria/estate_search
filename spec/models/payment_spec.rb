require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:answer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 0, approved: 1) }
  end

  describe 'delegations' do
    it 'delegates #question to answer' do
      payment = create(:payment)
      expect(payment.question).to eq(payment.answer.question)
    end
  end
end
