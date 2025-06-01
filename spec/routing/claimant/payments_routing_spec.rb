require "rails_helper"

RSpec.describe Claimant::PaymentsController, type: :routing do
  describe "routing" do
    it "routes to #update via PATCH" do
      expect(patch: "/claimant/payments/1").to route_to("claimant/payments#update", id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/claimant/payments/1").to route_to("claimant/payments#update", id: "1")
    end
  end
end
