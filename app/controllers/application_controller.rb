class ApplicationController < ActionController::Base
    def authenticate_admin
        redirect_to root_path, notice: 'Are you chiki chiki?' unless current_user&.admin?
    end

    def authenticate_owner(resource)
        redirect_to root_path, notice: 'Are you chiki chiki?' unless current_user&.admin? || resource.user_id === current_user.id
    end

    def is_user_property(resource)
        redirect_to root_path, notice: 'Are you chiki chiki chiki boom?' unless current_user&.admin? || current_user.id === resource.user_id
    end
    
end
