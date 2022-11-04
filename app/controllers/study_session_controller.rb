class StudySessionController < ApplicationController
  # before_action :authenticate_user!, only: %i[ update ]
  def update
    if params[:direction]==='Next'
      current_user.study_session.update_next_group
    elsif params[:direction]==='Previous'
        current_user.study_session.update_previous_group
    end 
    redirect_to lesson_path(current_user.current_lesson)
  end 
end