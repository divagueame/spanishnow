class DragController < ApplicationController
  def lesson
    @lesson = Lesson.find(drag_note_params[:id])
    @lesson.insert_at(lesson[:position].to_i + 1)
  end

  private

  def drag_lesson_params
    params.require(:resource).permit(:id, :position)
  end
end
