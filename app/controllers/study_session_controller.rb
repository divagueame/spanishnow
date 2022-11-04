class StudySessionController < ApplicationController
  # before_action :authenticate_user!, only: %i[ update ]
  def update
    if params[:direction] == 'Next'
      current_user.study_session.update_next_group
    elsif params[:direction] == 'Previous'
      current_user.study_session.update_previous_group
    end
    @current_lesson_group = current_user.study_session.lesson_group

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = 'Next!' }
      # redirect_to lesson_path(current_user.current_lesson)
    end
  end
end
