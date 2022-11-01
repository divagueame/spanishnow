class UserTextBlocksController < ApplicationController
  before_action :authenticate_admin, only: %i[index destroy edit update]
  before_action :set_user_text_block, only: %i[ show edit update destroy ]
  # before_action :set_lesson, only: %i[ new ]
  # before_action only: %i[ edit update show] do
  #   is_user_property(@user_text_block)
  # end
  
  def index
    @user_text_blocks = UserTextBlock.all
  end

  def show
  end


  def new
    @lesson_group_id = params[:lesson_group_id]
    @user_text_block = UserTextBlock.new
    @user_text_block.build_lesson_block
  end


  def edit
  end


  def create
    @user_text_block = UserTextBlock.new(user_text_block_params)
    @lesson_group = LessonGroup.find((user_text_block_params[:lesson_block_attributes][:lesson_group_id]))
    
    respond_to do |format|
      if @user_text_block.lesson_block.save
        format.html { redirect_to lesson_group_path(@lesson_group), notice: "User text block was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_text_block.update(user_text_block_params)
        format.html { redirect_to lesson_path(@user_text_block.lesson_group.lesson), notice: "User text block was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  def destroy
    @user_text_block.destroy

    respond_to do |format|
      format.html { redirect_to user_text_blocks_url, notice: "User text block was successfully destroyed." }
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:lesson_id])
    end

    def set_user_text_block
      @user_text_block = UserTextBlock.find(params[:id])
    end

    def user_text_block_params
      params.require(:user_text_block)
            .permit(:promptTitle, :promptBody, :promptLength,
              lesson_block_attributes: [:title, :id, :lesson_group_id]
)
    end
end
