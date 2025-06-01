require 'rails_helper'

RSpec.describe "Lawyer::Dashboard", type: :request do
  let!(:lawyer) { create(:user, :lawyer) }
  let!(:claimant) { create(:user, :claimant) }

  before do
    sign_in lawyer
  end

  describe "GET /lawyer" do
    it "renders a successful response and shows not-closed questions" do
      create(:question, user: claimant, status: :open, title: "Open Question")
      create(:question, user: claimant, status: :answered, title: "Answered Question")
      create(:question, user: claimant, status: :closed, title: "Closed Question")

      get lawyer_root_path

      expect(response).to be_successful
      expect(response.body).to include("Questions")
      expect(response.body).to include("Open Question")
      expect(response.body).to include("Answered Question")
      expect(response.body).not_to include("Closed Question")
    end
  end
end
