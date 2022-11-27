class DragController < ApplicationController
  before_action :authenticate_admin

  def lesson
    @lesson = Lesson.find(drag_lesson_params[:id])
    @lesson.insert_at(drag_lesson_params[:position].to_i + 1)
  end

  def lesson_group
    @lesson_group = LessonGroup.find(drag_lesson_group_params[:id])
    @lesson_group.insert_at(drag_lesson_group_params[:position].to_i + 1)
  end

  def lesson_block
    @lesson_block = LessonBlock.find(drag_lesson_block_params[:id])
    @lesson_block.insert_at(drag_lesson_block_params[:position].to_i + 1)
  end

  private

  def drag_lesson_params
    params.require(:resource).permit(:id, :position)
  end

  def drag_lesson_group_params
    params.require(:resource).permit(:id, :position)
  end
  
  def drag_lesson_block_params
    params.require(:resource).permit(:id, :position)
  end
end
