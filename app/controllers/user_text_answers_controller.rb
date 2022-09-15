class UserTextAnswersController < ApplicationController
  before_action :set_user_text_block, only: %i[new create edit update]
  before_action :set_user_text_answer, only: %i[edit update show  destroy ]

  # def index
    # @user_text_answers = UserTextAnswer.all
    # @user_text_block.user_text_answers
  # end

  # def show
  # end

  def new
    @user_text_answer = @user_text_block.user_text_answers.build(user_id: current_user.id)
  end

  def edit
    redirect_to root_path unless current_user&.id === @user_text_answer.user_id
  end

  def create

    @user_text_answer = UserTextAnswer.new(user_text_answer_params)
    @user_text_answer = @user_text_block.user_text_answers.build(user_id: current_user.id)
    # p '@user_text_block'
    # p @user_text_block
    # p '@user_text_answer'
    # p @user_text_answer
    # p @user_text_answer.valid?

    respond_to do |format|
      if @user_text_answer.save
        format.html { redirect_to lesson_path(@user_text_block.lesson), notice: "Genial! Buen trabajo." }

      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @user_text_answer.update(user_text_answer_params)
        format.html { redirect_to lesson_path(@user_text_block.lesson), notice: "User text answer was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user_text_answer.destroy

    respond_to do |format|
      format.html { redirect_to user_text_answers_url, notice: "User text answer was successfully destroyed." }
    end
  end

  private
    def set_user_text_block
      @user_text_block = UserTextBlock.find(params[:user_text_block_id])
    end

    def set_user_text_answer
      @user_text_answer = UserTextAnswer.find(params[:id])
    end

    def user_text_answer_params
      params.require(:user_text_answer).permit(:title, :body, :user_id, :user_text_block_id)
    end
end
