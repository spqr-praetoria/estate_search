class Lawyer::AnswersController < Lawyer::ApplicationController
  before_action :set_question, only: :new

  def new
    authorize! @question
    @answer = Answer.new
  end

  def create
      @answer = current_user.answers.build(answer_params.merge(question_id: params[:question_id]))
      authorize! @answer

      if AnswerCreationService.new(@answer).call
      respond_to do |format|
        format.html { redirect_to lawyer_root_path, notice: "Answer was successfully created." }
        format.turbo_stream
      end
      else
      render :new, status: :unprocessable_entity
      end
  end

  private

  def answer_params
    params.expect(answer: [ :lawyer_id, :body, :proposed_fee, :status ])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
