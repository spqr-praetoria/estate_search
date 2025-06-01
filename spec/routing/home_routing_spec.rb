require "rails_helper"

RSpec.describe HomeController, type: :routing do
  it "routes root to home#index" do
    expect(get: "/").to route_to(controller: "home", action: "index")
  end
end
