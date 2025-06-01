require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it 'validates email format' do
      valid_user = build(:user, email: 'valid@example.com')
      invalid_user = build(:user, email: 'invalid-email')
      expect(valid_user).to be_valid
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:email]).to include('must be a valid email like name@example.com')
    end
  end

  describe 'enums' do
    it { should define_enum_for(:role).with_values(claimant: 0, lawyer: 1, admin: 2) }
  end

  describe 'devise modules' do
    it 'responds to Devise modules' do
      expect(subject).to respond_to(:valid_password?)
      expect(subject).to respond_to(:send_reset_password_instructions)
    end
  end

  describe 'associations' do
    it { should have_many(:questions).dependent(:destroy) }
    it { should have_many(:answers).with_foreign_key(:lawyer_id).dependent(:destroy) }
    it { should have_many(:payments).dependent(:destroy) }
  end

  describe 'dependent destroy' do
    it 'destroys associated questions when user is destroyed' do
      user = create(:user, :claimant)
      create_list(:question, 2, user: user)
      expect { user.destroy }.to change { Question.count }.by(-2)
    end

    it 'destroys associated answers when lawyer is destroyed' do
      lawyer = create(:user, :lawyer)
      create_list(:answer, 2, lawyer: lawyer)
      expect { lawyer.destroy }.to change { Answer.count }.by(-2)
    end

    it 'destroys associated payments when user is destroyed' do
      user = create(:user)
      create_list(:payment, 2, user: user)
      expect { user.destroy }.to change { Payment.count }.by(-2)
    end
  end

  describe '#name' do
    it 'returns the full name' do
      user = build(:user, first_name: 'Jane', last_name: 'Smith')
      expect(user.name).to eq('Jane Smith')
    end
  end
end
