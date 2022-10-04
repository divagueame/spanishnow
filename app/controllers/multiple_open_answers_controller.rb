class MultipleOpenAnswersController < ApplicationController
  before_action :set_multiple_open_answer, only: %i[ show edit update destroy ]

  # GET /multiple_open_answers or /multiple_open_answers.json
  def index
    @multiple_open_answers = MultipleOpenAnswer.all
  end

  # GET /multiple_open_answers/1 or /multiple_open_answers/1.json
  def show
  end

  # GET /multiple_open_answers/new
  def new
    @multiple_open_answer = MultipleOpenAnswer.new
  end

  # GET /multiple_open_answers/1/edit
  def edit
  end

  # POST /multiple_open_answers or /multiple_open_answers.json
  def create
    @multiple_open_answer = MultipleOpenAnswer.new(multiple_open_answer_params)

    respond_to do |format|
      if @multiple_open_answer.save
        format.html { redirect_to multiple_open_answer_url(@multiple_open_answer), notice: "Multiple open answer was successfully created." }
        format.json { render :show, status: :created, location: @multiple_open_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @multiple_open_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiple_open_answers/1 or /multiple_open_answers/1.json
  def update
    respond_to do |format|
      if @multiple_open_answer.update(multiple_open_answer_params)
        format.html { redirect_to multiple_open_answer_url(@multiple_open_answer), notice: "Multiple open answer was successfully updated." }
        format.json { render :show, status: :ok, location: @multiple_open_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @multiple_open_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiple_open_answers/1 or /multiple_open_answers/1.json
  def destroy
    @multiple_open_answer.destroy

    respond_to do |format|
      format.html { redirect_to multiple_open_answers_url, notice: "Multiple open answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiple_open_answer
      @multiple_open_answer = MultipleOpenAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multiple_open_answer_params
      params.require(:multiple_open_answer).permit(:user_answer, :multiple_open_piece_id, :user_id)
    end
end
