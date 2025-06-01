require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:answers).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it 'is valid with a valid status' do
      %w[open answered closed].each do |valid_status|
        question = build(:question, status: valid_status)
        expect(question).to be_valid
      end
    end

    it 'is valid with a valid category' do
      %w[general missing_assets wills_and_probate legal_heirship].each do |valid_category|
        question = build(:question, category: valid_category)
        expect(question).to be_valid
      end
    end
  end

  describe 'rich text' do
    it 'has rich text body' do
      question = create(:question)
      expect(question.body).to be_present
      expect(question.body.class).to eq(ActionText::RichText)
    end
  end

  describe 'enums' do
    it { should define_enum_for(:category).with_values(general: 0, missing_assets: 1, wills_and_probate: 2, legal_heirship: 3) }
    it { should define_enum_for(:status).with_values(open: 0, answered: 1, closed: 2) }

    it 'raises an error when assigning an invalid status' do
      expect { build(:question, status: 'not_a_status') }.to raise_error(ArgumentError)
      expect { build(:question, status: 99) }.to raise_error(ArgumentError)
    end

    it 'raises an error when assigning an invalid category' do
      expect { build(:question, category: 'not_a_category') }.to raise_error(ArgumentError)
      expect { build(:question, category: 99) }.to raise_error(ArgumentError)
    end
  end

  describe 'scopes' do
    describe '.not_closed' do
      it 'returns questions that are not closed' do
        open_question = create(:question, status: :open)
        answered_question = create(:question, status: :answered)
        closed_question = create(:question, status: :closed)
        expect(Question.not_closed).to include(open_question, answered_question)
        expect(Question.not_closed).not_to include(closed_question)
      end
    end
  end

  describe '#answered_by?' do
    it 'returns true if the question has an answer by the given lawyer' do
      question = create(:question)
      lawyer = create(:user, :lawyer)
      create(:answer, question: question, lawyer: lawyer)
      expect(question.answered_by?(lawyer)).to be true
    end

    it 'returns false if the question does not have an answer by the given lawyer' do
      question = create(:question)
      lawyer = create(:user, :lawyer)
      expect(question.answered_by?(lawyer)).to be false
    end
  end

  describe 'after_create_commit' do
    it 'broadcasts to questions' do
      question = create(:question)
      expect(question.body).to be_present
    end
  end

  describe 'after_update_commit' do
    it 'broadcasts to questions' do
      question = create(:question)
      expect(question.body).to be_present
    end
  end

  describe 'after_destroy_commit' do
    it 'broadcasts to questions' do
      question = create(:question)
      expect(question.body).to be_present
    end
  end
end
