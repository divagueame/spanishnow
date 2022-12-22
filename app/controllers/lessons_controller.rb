class LessonsController < ApplicationController
  before_action :authenticate_admin, only: %i[new edit create update destroy toggle_active_lesson]
  before_action :authenticate_user!, only: %i[show]
  before_action :set_lesson, only: %i[show edit update destroy toggle_active_lesson]
  before_action :set_active_lesson_group, only: %i[ show ]

  before_action only: %i[show] do
    filter_active(@lesson)
  end

  def show
    @lesson_groups = @lesson.lesson_groups
    return if current_user.admin?
#is_opened_navigatiois_opened_navigationn   @study_session = current_user.study_session

  if params[:is_opened_navigation] 
    @is_opened_navigation=true
  else
    @is_opened_navigation=false
  end 
    respond_to do |format|
        format.html
        format.turbo_stream 
    end
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new(course_id: @course.id)
  end

  def edit; end

  def create
    @lesson = Lesson.new(lesson_params)
    
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: 'Lesson was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: 'Lesson was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = "Lesson was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = @lesson.course_id
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to course_url(@course), notice: 'Lesson was successfully destroyed.', status: 303 }
    end
  end

  def toggle_active_lesson
    @lesson.update(active: !@lesson.active)
    redirect_back(fallback_location: lessons_path)
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_active_lesson_group
    
    @active_lesson_group = LessonGroup.find(params[:active_lesson_group]) if params[:active_lesson_group].present?
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :position, :product_id, :active, :course_id, :image, :active_lesson_group, :is_opened_navigation)
  end
end
