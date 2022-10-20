class LessonGroupsController < ApplicationController
  before_action :authenticate_admin, only: %i[ new edit create update destroy toggle_active_lesson]
  before_action :authenticate_user!, only: %i[ index show]
  before_action :set_lesson_group, only: %i[ show edit update destroy ]
  before_action :set_lesson, only: %i[ new create]

  
  def index
    @lesson_groups = LessonGroup.all
    @lonely_lesson_groups = LessonGroup.where(lesson_id: nil)
  end

  def show
  end


  def new
    @lesson_group = @lesson.lesson_groups.build(lesson_id: @lesson.id)
  end


  def edit
  end


  def create
    @lesson_group = @lesson.lesson_groups.build(lesson_group_params)
    
    respond_to do |format|
      if @lesson_group.save
        format.html { redirect_to lesson_group_url(@lesson_group), notice: "Lesson group was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @lesson_group.update(lesson_group_params)
        format.html { redirect_to lesson_group_url(@lesson_group), notice: "Lesson group was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @lesson_group.destroy

    respond_to do |format|
      format.html { redirect_to lesson_groups_url, notice: "Lesson group was successfully destroyed." }
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find_or_initialize_by(id: params[:lesson_id])
    end
    
    def set_lesson_group
      @lesson_group = LessonGroup.find(params[:id])
    end

    def lesson_group_params
      params.require(:lesson_group).permit(:title, :description, :position, :lesson_id)
    end
end
