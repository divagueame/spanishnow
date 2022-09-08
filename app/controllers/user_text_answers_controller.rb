class UserTextAnswersController < ApplicationController
  before_action :set_user_text_answer, only: %i[ show edit update destroy ]

  # GET /user_text_answers or /user_text_answers.json
  def index
    @user_text_answers = UserTextAnswer.all
  end

  # GET /user_text_answers/1 or /user_text_answers/1.json
  def show
  end

  # GET /user_text_answers/new
  def new
    @user_text_answer = UserTextAnswer.new
  end

  # GET /user_text_answers/1/edit
  def edit
  end

  # POST /user_text_answers or /user_text_answers.json
  def create
    @user_text_answer = UserTextAnswer.new(user_text_answer_params)

    respond_to do |format|
      if @user_text_answer.save
        format.html { redirect_to user_text_answer_url(@user_text_answer), notice: "User text answer was successfully created." }
        format.json { render :show, status: :created, location: @user_text_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_text_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_text_answers/1 or /user_text_answers/1.json
  def update
    respond_to do |format|
      if @user_text_answer.update(user_text_answer_params)
        format.html { redirect_to user_text_answer_url(@user_text_answer), notice: "User text answer was successfully updated." }
        format.json { render :show, status: :ok, location: @user_text_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_text_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_text_answers/1 or /user_text_answers/1.json
  def destroy
    @user_text_answer.destroy

    respond_to do |format|
      format.html { redirect_to user_text_answers_url, notice: "User text answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_text_answer
      @user_text_answer = UserTextAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_text_answer_params
      params.require(:user_text_answer).permit(:title, :body, :user_id)
    end
end
