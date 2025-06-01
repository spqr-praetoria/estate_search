require 'rails_helper'

RSpec.describe "Claimant::Dashboard", type: :request do
  let!(:claimant) { create(:user, :claimant) }

  before do
    sign_in claimant
  end

  describe "GET /claimant" do
    it "renders a successful response and shows the user's questions" do
      create(:question, user: claimant, title: "First Question")
      create(:question, user: claimant, title: "Second Question")

      get claimant_root_path

      expect(response).to be_successful
      expect(response.body).to include("Questions")
      expect(response.body).to include("First Question")
      expect(response.body).to include("Second Question")
    end

    it "does not show questions from other users" do
      other_user = create(:user, :claimant)
      create(:question, user: other_user, title: "Other's Question")
      get claimant_root_path
      expect(response.body).not_to include("Other's Question")
    end
  end
end
