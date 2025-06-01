require "rails_helper"

RSpec.describe Admin::DashboardPolicy, type: :policy do
  let(:user) { build_stubbed :user, :admin }
  let(:policy) { described_class.new(user: user) }

  describe "#index?" do
    it "allows admin users" do
      expect(policy.index?).to be true
    end

    context "when user is not admin" do
      let(:user) { build_stubbed :user, :claimant }

      it "forbids non-admin users" do
        expect(policy.index?).to be false
      end
    end
  end
end
