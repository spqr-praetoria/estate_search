require "rails_helper"

RSpec.describe Lawyer::QuestionsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/lawyer/questions/1").to route_to("lawyer/questions#show", id: "1")
    end
  end
end
