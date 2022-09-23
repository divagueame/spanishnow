class ApplicationController < ActionController::Base
    def authenticate_admin
        redirect_to root_path, notice: 'Are you chiki chiki?' unless current_user&.admin?
    end

    def authenticate_owner(resource)
        redirect_to root_path, notice: 'Are you chiki chiki?' unless current_user&.admin? || resource.user_id === current_user&.id
    end

    def is_user_property(resource)
        redirect_to root_path, notice: 'Are you chiki chiki chiki boom?' unless current_user&.admin? || current_user.id === resource.user_id
    end

    def filter_active(resource)"You have about 1 hour left to complete this lesson."
        redirect_to root_path, notice: 'Nope' unless current_user&.admin? || resource.active
    end

    def active_study_session
        return nil if current_user.study_session.nil?
        current_user.study_session
    end

    def filter_study_session(lesson)
        current_study_session = active_study_session
        
        if current_study_session.nil?
            p 'No active study lesson. Create new'
            StudySession.create(user_id: current_user.id, lesson_id: @lesson.id)
        elsif !lesson.this_lesson_study_session?(current_study_session) && !current_study_session.session_ended?
            p 'Has active study lesson, but wrong lesson'
            redirect_to lesson_path(current_study_session.lesson), notice: "Please, continue with your lesson. You still have #{current_study_session.time_left} left"
        elsif current_study_session.session_ended?
            p 'Session ended. Updating lesson'
            current_study_session.update(lesson_id: lesson.id)
        else
            p 'Has active study lesson and is the right lesson'
            flash[:notice] = "You have #{current_study_session.time_left} left to complete this lesson."
        end
    
    end
end
