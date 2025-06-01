require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { should belong_to(:question) }
    it { should belong_to(:lawyer).class_name('User') }
    it { should have_one(:payment).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:proposed_fee) }
  end

  describe 'rich text' do
    it 'has rich text body' do
      answer = create(:answer)
      expect(answer.body).to be_present
      expect(answer.body.class).to eq(ActionText::RichText)
    end
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(unpaid: 0, paid: 1) }
  end

  describe 'dependent destroy' do
    it 'destroys associated payment when answer is destroyed' do
      answer = create(:answer)
      create(:payment, answer: answer, user: answer.lawyer)
      expect { answer.destroy }.to change { Payment.count }.by(-1)
    end
  end
end
