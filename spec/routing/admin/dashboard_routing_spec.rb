require "rails_helper"

RSpec.describe Admin::DashboardController, type: :routing do
  it "routes GET /admin to admin/dashboard#index" do
    expect(get: "/admin").to route_to(controller: "admin/dashboard", action: "index")
  end
end
