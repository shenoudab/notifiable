ActiveSupport.on_load(:action_view) { include NotifiableHelpers }

module Notifiable
  class Engine < ::Rails::Engine
    #config.notifiable = Notifiable
  end
end