class LessonsController < ApplicationController
  before_action :authenticate_admin, only: %i[new edit create update destroy toggle_active_lesson]
  before_action :authenticate_user!, only: %i[show]
  before_action :set_lesson, only: %i[show edit update destroy toggle_active_lesson]

  before_action only: %i[show] do
    filter_active(@lesson)
  end

  before_action only: %i[show] do
    filter_study_session(@lesson) unless current_user.admin?
  end


  def show
    @lesson_groups = @lesson.lesson_groups
    return if current_user.admin?

    @study_session = current_user.study_session
    @active_lesson_group = LessonGroup.find(@study_session.lesson_group_id)
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

  def lesson_params
    params.require(:lesson).permit(:title, :description, :position, :product_id, :active, :course_id)
  end
end
