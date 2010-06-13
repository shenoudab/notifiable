module Notifiable
  class NotificationsController < ApplicationController
    
    unloadable
    
    def new
      @notification = Notification.new
    end

    def create
      @notification = Notification.new(params[:notifiable_notification])
      if @notification.valid?
        @subscriber.save
      end
    end

    def dismiss
      notification = Notification.find(params[:id])
      notification.update_attribute('dismissed', true)
      respond_to do |format|
        format.js {
          render :update do |page|
            page.remove "system_message_#{notification.id}"
          end
        }
      end
    end
  end
end
