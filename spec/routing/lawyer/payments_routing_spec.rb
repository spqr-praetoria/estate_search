require "rails_helper"

RSpec.describe Lawyer::PaymentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lawyer/payments").to route_to("lawyer/payments#index")
    end

    it "routes to #new" do
      expect(get: "/lawyer/payments/new").to route_to("lawyer/payments#new")
    end

    it "routes to #show" do
      expect(get: "/lawyer/payments/1").to route_to("lawyer/payments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lawyer/payments/1/edit").to route_to("lawyer/payments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lawyer/payments").to route_to("lawyer/payments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lawyer/payments/1").to route_to("lawyer/payments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lawyer/payments/1").to route_to("lawyer/payments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lawyer/payments/1").to route_to("lawyer/payments#destroy", id: "1")
    end
  end
end
