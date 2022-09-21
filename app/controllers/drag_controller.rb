class DragController < ApplicationController
  before_action :authenticate_admin

  def lesson
    @lesson = Lesson.find(drag_lesson_params[:id])
    
    @lesson.insert_at(drag_lesson_params[:position].to_i + 1)
  end

  private

  def drag_lesson_params
    params.require(:resource).permit(:id, :position)
  end
end
