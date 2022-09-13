class FeedbacksController < ApplicationController
  before_action :authenticate_admin, only: %i[ new create edit update destroy]

  before_action :set_user_text_answer, only: %i[ edit update destroy ]
  before_action :set_feedback, only: %i[ show edit update destroy ]

  before_action only: %i[ show ] do
    authenticate_owner(@feedback.user_text_answer)
  end

  def show
  end

  def new
    @user_text_answer = UserTextAnswer.find(params[:user_text_answer_id])
    @answer_owner = @user_text_answer.user
    @feedback = Feedback.new(user_text_answer_id: @user_text_answer.id, user_id: current_user.id)
  end


  def edit
  end


  def create
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to admin_url, notice: "Feedback was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to feedback_url(@feedback), notice: "Feedback was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: "Feedback was successfully destroyed." }
    end
  end

  private
    def set_user_text_answer
      @user_text_answer = UserTextAnswer.find(params[:user_text_answer_id])
      @answer_owner = @user_text_answer.user
    end
    
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:body, :seen, :user_id, :user_text_answer_id)
    end
end
