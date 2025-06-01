require 'rails_helper'

RSpec.describe Claimant::PaymentsPolicy, type: :policy do
  let(:claimant) { build(:user, :claimant) }
  let(:lawyer) { build(:user, :lawyer) }
  let(:admin) { build(:user, :admin) }
  let(:payment) { build(:payment, user: claimant) }

  describe '#update?' do
    it 'allows claimant users' do
      policy = described_class.new(user: claimant, record: payment)
      expect(policy.update?).to be true
    end
    it 'forbids lawyer users' do
      policy = described_class.new(user: lawyer, record: payment)
      expect(policy.update?).to be false
    end
    it 'forbids admin users' do
      policy = described_class.new(user: admin, record: payment)
      expect(policy.update?).to be false
    end
  end
end
