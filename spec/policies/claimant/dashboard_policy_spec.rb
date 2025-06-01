require "rails_helper"

RSpec.describe Claimant::DashboardPolicy, type: :policy do
  let(:user) { build_stubbed :user, :claimant }
  let(:policy) { described_class.new(user: user) }

  describe "#index?" do
    it "allows user users" do
      expect(policy.index?).to be true
    end

    context "when user is not user" do
      let(:user) { build_stubbed :user, :lawyer }

      it "forbids non-user users" do
        expect(policy.index?).to be false
      end
    end
  end
end
