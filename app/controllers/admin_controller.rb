class AdminController < ApplicationController

  # before_action :is_admin?
  def index
    redirect_to root_path
  end

  private 
    def is_admin?
      redirect_to root_path unless current_user.is_admin? 
    end

end
