require "rails_helper"

RSpec.describe Claimant::QuestionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/claimant/questions").to route_to("claimant/questions#index")
    end

    it "routes to #new" do
      expect(get: "/claimant/questions/new").to route_to("claimant/questions#new")
    end

    it "routes to #show" do
      expect(get: "/claimant/questions/1").to route_to("claimant/questions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/claimant/questions/1/edit").to route_to("claimant/questions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/claimant/questions").to route_to("claimant/questions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/claimant/questions/1").to route_to("claimant/questions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/claimant/questions/1").to route_to("claimant/questions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/claimant/questions/1").to route_to("claimant/questions#destroy", id: "1")
    end
  end
end
