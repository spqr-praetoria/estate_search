class Lawyer::AnswerController < Lawyer::ApplicationController
  before_action :set_question, only: %i[ new create ]
  before_action :set_answer, only: %i[ show edit update destroy ]

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to lawyer_question_path(@question)
  end

  private

  def answer_params
    params.expect(answer: [ :body, :question_id, :lawyer_id, :proposed_fee ])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
