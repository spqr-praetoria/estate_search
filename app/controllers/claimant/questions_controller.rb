class Claimant::QuestionsController < Claimant::ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      respond_to do |format|
        format.html { redirect_to claimant_root_path, notice: "Question was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      respond_to do |format|
        format.html { redirect_to claimant_root_path, notice: "Question was successfully updated.", status: :see_other }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy!

    respond_to do |format|
      format.html { redirect_to claimant_root_path, notice: "Question was successfully destroyed.", status: :see_other }
      format.turbo_stream
    end
  end

  private

  def set_question
    @question = Question.find(params.expect(:id))
  end

  def question_params
    params.expect(question: [ :user_id, :title, :body, :category, :status ])
  end
end
