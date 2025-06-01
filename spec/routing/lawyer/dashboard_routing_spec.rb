require "rails_helper"

RSpec.describe Lawyer::DashboardController, type: :routing do
  it "routes GET /lawyer/dashboard to lawyer/dashboard#index" do
    expect(get: "/lawyer/dashboard").to route_to(controller: "lawyer/dashboard", action: "index")
  end
end
