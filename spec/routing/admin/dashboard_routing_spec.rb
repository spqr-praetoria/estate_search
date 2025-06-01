require "rails_helper"

RSpec.describe Admin::DashboardController, type: :routing do
  it "routes GET /admin/dashboard to admin/dashboard#index" do
    expect(get: "/admin/dashboard").to route_to(controller: "admin/dashboard", action: "index")
  end
end
