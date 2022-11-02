class StudySessionController < ApplicationController
  # before_action :authenticate_user!, only: %i[ update ]
  def update
    if params[:direction]==='next'
      current_user.study_session.update_next_group
    end
    # current_user.study_session.update(lesson_group)
    redirect_to lesson_path(current_user.current_lesson)
  end

  # private
  # def study_session_params
    # params.require(:study_session).permit(:id, :direction)
  # end
end