require 'rails_helper'

RSpec.describe Lawyer::AnswerPolicy, type: :policy do
  let(:lawyer) { build(:user, :lawyer) }
  let(:claimant) { build(:user, :claimant) }
  let(:admin) { build(:user, :admin) }
  let(:answer) { build(:answer) }

  describe '#show?' do
    it 'allows lawyer users' do
      policy = described_class.new(user: lawyer, record: answer)
      expect(policy.show?).to be true
    end

    it 'forbids claimant users' do
      policy = described_class.new(user: claimant, record: answer)
      expect(policy.show?).to be false
    end

    it 'forbids admin users' do
      policy = described_class.new(user: admin, record: answer)
      expect(policy.show?).to be false
    end
  end

  describe '#create?' do
    it 'allows lawyer users' do
      policy = described_class.new(user: lawyer, record: answer)
      expect(policy.create?).to be true
    end

    it 'forbids claimant users' do
      policy = described_class.new(user: claimant, record: answer)
      expect(policy.create?).to be false
    end

    it 'forbids admin users' do
      policy = described_class.new(user: admin, record: answer)
      expect(policy.create?).to be false
    end
  end
end
