require "rails_helper"

RSpec.describe Lawyer::DashboardPolicy, type: :policy do
  let(:user) { build_stubbed :user, :lawyer }
  let(:policy) { described_class.new(user: user) }

  describe "#index?" do
    it "allows lawyer users" do
      expect(policy.index?).to be true
    end

    context "when user is not lawyer" do
      let(:user) { build_stubbed :user, :admin }

      it "forbids non-lawyer users" do
        expect(policy.index?).to be false
      end
    end
  end
end
