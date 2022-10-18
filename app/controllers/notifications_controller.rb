class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i[ index show]
  before_action :set_notifications, only: %i[ index ] 
  before_action :set_notification, only: %i[ show ] 
  
  def index
  end
    
  def show
    @notification.update(seen: true)
  end

  private


  def notification_params
    params.require(:notification).permit(:id)
  end


  def set_notification
    @notification = current_user.notifications.find(params[:id])
  end

  def set_notifications
    @notifications = current_user.notifications
  end

end
