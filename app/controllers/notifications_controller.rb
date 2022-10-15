class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i[ index ]
  before_action :set_notifications, only: %i[ index ] 
  
  def index
  end

  private

  def set_notifications
    @notifications = current_user.notifications
  end

end
