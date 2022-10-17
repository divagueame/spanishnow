class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i[ index show]
  before_action :set_notifications, only: %i[ index ] 
  before_action :set_notification, only: %i[ show ] 
  
  def index
  end
    
  def show

  end

  private


  def notification_params
    params.require(:notification).permit(:id)
  end


  def set_notification
    @notification = current_user.notifications.find(params[:id])
  end

  def set_notifications
    notifications = current_user.notifications
    @unseen_notifications = notifications.where(seen: false)
    @seen_notifications = notifications.where(seen: true)
  end

end
