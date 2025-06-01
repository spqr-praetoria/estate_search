require 'rails_helper'

RSpec.describe Lawyer::QuestionPolicy, type: :policy do
  let(:lawyer) { build(:user, :lawyer) }
  let(:claimant) { build(:user, :claimant) }
  let(:admin) { build(:user, :admin) }
  let(:question) { build(:question) }

  describe '#show?' do
    it 'allows lawyer users' do
      policy = described_class.new(user: lawyer, record: question)
      expect(policy.show?).to be true
    end

    it 'forbids claimant users' do
      policy = described_class.new(user: claimant, record: question)
      expect(policy.show?).to be false
    end

    it 'forbids admin users' do
      policy = described_class.new(user: admin, record: question)
      expect(policy.show?).to be false
    end
  end

  describe '#new?' do
    it 'allows lawyer users' do
      policy = described_class.new(user: lawyer, record: question)
      expect(policy.new?).to be true
    end

    it 'forbids claimant users' do
      policy = described_class.new(user: claimant, record: question)
      expect(policy.new?).to be false
    end

    it 'forbids admin users' do
      policy = described_class.new(user: admin, record: question)
      expect(policy.new?).to be false
    end
  end
end
