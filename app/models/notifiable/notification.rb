module Notifiable
  class Notification < ActiveRecord::Base

    validates :level, :presence => true
    validates :header, :presence => true
    validates :message, :presence => true
    validates :expires, :presence => true
  
    named_scope :global,   :conditions => {:notifiable_id => nil}
    named_scope :viewable, lambda { {:conditions => ["dismissed = ? AND expires > ?", false, Time.now]} }

    belongs_to :notifiable, :polymorphic => true

    def viewable?
      !dismissed? && !expired?
    end

    def expired?
      Time.now > expires
    end
    
  end
end
