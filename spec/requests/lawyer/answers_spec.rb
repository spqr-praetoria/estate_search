require 'rails_helper'

RSpec.describe "Lawyer::Answers", type: :request do
  let!(:lawyer) { create(:user, :lawyer) }
  let!(:claimant) { create(:user, :claimant) }
  let!(:question) { create(:question, user: claimant) }

  before do
    sign_in lawyer
  end

  describe "GET /lawyer/questions/:question_id/answers/new" do
    it "renders a successful response" do
      get new_lawyer_question_answer_path(question)
      expect(response).to be_successful
      expect(response.body).to include("Answer")
    end
  end
end
