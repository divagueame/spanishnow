class ApplicationController < ActionController::Base
  helper_method :active_study_session

  def authenticate_admin
    redirect_to root_path, notice: 'Are you chiki chiki?' unless current_user&.admin?
  end

  def authenticate_owner(resource)
    return if current_user&.admin? || resource.user_id === current_user&.id

    redirect_to root_path,
                notice: 'Are you chiki chiki?'
  end

  def is_user_property(resource)
    return if current_user&.admin? || current_user.id === resource.user_id

    redirect_to root_path,
                notice: 'Are you chiki chiki chiki boom?'
  end

  def filter_active(resource)
    redirect_to root_path, notice: 'Nope' unless current_user&.admin? || resource.active
  end

  def active_study_session
    return nil if current_user.study_session.nil?

    current_user.study_session
  end

end
