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
end
