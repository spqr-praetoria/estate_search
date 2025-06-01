class Claimant::QuestionsController < Claimant::ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions
  def index
    @questions = current_user.questions.eager_load(:answers).order(created_at: :desc)
  end

  # GET /questions/1
  def show
    @title = "Question & Answers"

    # TODO: If this becomes a performance issue, we can opt for a materialized view (scenic gem)
    # https://github.com/scenic-views/scenic
    @question = Question.eager_load(:user, answers: [ :lawyer, :payment ])
                        .order("answers.created_at DESC")
                        .find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      respond_to do |format|
        format.html { redirect_to claimant_question_path(@question), notice: "Question was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      respond_to do |format|
        format.html { redirect_to claimant_question_path(@question), notice: "Question was successfully updated.", status: :see_other }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy!

    respond_to do |format|
      format.html { redirect_to claimant_questions_path, notice: "Question was successfully destroyed.", status: :see_other }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.expect(question: [ :user_id, :title, :body, :category, :status ])
    end
end
