ActiveSupport.on_load(:action_view) { include Notifiable::Helpers::NotifiableHelpers }

module Notifiable
  class Engine < ::Rails::Engine
    
  end
end
