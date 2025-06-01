require "rails_helper"

RSpec.describe Claimant::DashboardController, type: :routing do
  it "routes GET /claimant/dashboard to claimant/dashboard#index" do
    expect(get: "/claimant/dashboard").to route_to(controller: "claimant/dashboard", action: "index")
  end
end
