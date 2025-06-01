require "rails_helper"

RSpec.describe Lawyer::DashboardController, type: :routing do
  it "routes GET /lawyer to lawyer/dashboard#index" do
    expect(get: "/lawyer").to route_to(controller: "lawyer/dashboard", action: "index")
  end
end
