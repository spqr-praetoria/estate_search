require "rails_helper"

RSpec.describe Lawyer::AnswersController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/lawyer/questions/1/answers/new").to route_to("lawyer/answers#new", question_id: "1")
    end

    it "routes to #show" do
      expect(get: "/lawyer/questions/1/answers/1").to route_to("lawyer/answers#show", question_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/lawyer/questions/1/answers").to route_to("lawyer/answers#create", question_id: "1")
    end
  end
end
