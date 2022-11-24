class StudySessionController < ApplicationController
  before_action :authenticate_user!#, only: %i[ update ]

  def destroy 
    @study_session =  StudySession.find(params[:id])
    p @study_session
    @study_session.destroy
    redirect_to course_path(Course.first), notice: "Lesson group was successfully destroyed.", status: 303 
  end

  def update
    if params[:direction] == 'Next'
      current_user.study_session.update_next_group
    elsif params[:direction] == 'Previous'
      current_user.study_session.update_previous_group
    elsif params[:direction] == 'Finish'
    end
    @current_lesson_group = current_user.study_session.lesson_group

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = 'Next!' }
    end
  end
end
