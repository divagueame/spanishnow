class AdminController < ApplicationController

  # before_action :is_admin?
  def index
    redirect_to root_path unless current_user&.admin?
  end

  private 
    # def is_admin?

      
    #   p 'current_user: '

    #   p current_user
    #   # redirect_to root_path unlessz
    #   p ' current_user.admin?'
    #   p current_user.admin?
    #   puts " /\--\n"
    # end

end
