class FeedbacksController < ApplicationController
  before_action :authenticate_admin, only: %i[ new create edit update destroy]

  before_action :set_user_text_answer, only: %i[ edit update destroy ]
  before_action :set_feedback, only: %i[ show edit update destroy ]

  before_action only: %i[ show ] do
    authenticate_owner(@feedback.user_text_answer)
  end
  before_action :ensure_frame_response, only: [:new]

  def show
    if !current_user.admin? && !@feedback.seen
      @feedback.update(seen: true)
    end
  end

  def new
    @user_text_answer = UserTextAnswer.find(params[:user_text_answer_id])
    @answer_owner = @user_text_answer.user
    @feedback = Feedback.new(user_text_answer_id: @user_text_answer.id)
  end


  def edit
  end


  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.turbo_stream { flash.now[:notice] = "Feedback was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { flash.now[:notice] = "Feedback already exists" }
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
      params.require(:feedback).permit(:body, :seen, :user_text_answer_id)
    end

    def ensure_frame_response
      return unless Rails.env.development?
      redirect_to root_path unless turbo_frame_request?
    end
end
