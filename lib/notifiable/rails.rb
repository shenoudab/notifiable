#ActiveSupport.on_load(:action_view) { include NotifiableHelpers }
ActiveSupport.on_load(:action_controller) { include Notifiable::Helpers::NotifiableHelpers }
ActiveSupport.on_load(:action_view) { include Notifiable::Helpers::NotifiableHelpers }

module Notifiable
  class Engine < ::Rails::Engine
    #config.notifiable = Notifiable
  end
end