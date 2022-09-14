class LessonsController < ApplicationController
  before_action :authenticate_admin, only: %i[ new edit create update destroy toggle_active_lesson]
  before_action :authenticate_user!, only: %i[ index show]
  before_action :set_lesson, only: %i[ show edit update destroy toggle_active_lesson]
  # before_action :filter_active_lesson, only: %i[ show ]

  before_action only: %i[ show ] do
    filter_active_lesson(@lesson)
  end
  def index
    if current_user.admin?
      @lessons = Lesson.all
    else
      @lessons = Lesson.where(active: true)
    end

    @lonely_lesson_blocks = LessonBlock.where(lesson_id: nil)
  end

  def show
    @lesson_blocks = @lesson.lesson_blocks
  end

  def new
    @lesson = Lesson.new
  end

  def edit
  end

  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
      else 
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed.", status: 303 }
    end
  end

  def toggle_active_lesson
    @lesson.update(active: !@lesson.active)
    redirect_to lesson_url(@lesson), notice: "Lesson is now #{@lesson.active ? "visible": 'hidden'}."
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:title, :description, :position, :product_id, :active)
    end
end
