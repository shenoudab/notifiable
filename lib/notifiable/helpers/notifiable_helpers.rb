module Notifiable
  module Helpers
    module NotifiableHelpers
      def notify_msg(message, options={})
        header = header_div(message.header, message.level)
        body = message.message
        base_options = {:class => "notify #{message.level}", :id => "notification_#{message.id}"}.merge(options)

        if message.dismissable?
          body += content_tag(:p, link_to_remote("Dismiss", :url => {:controller => 'notifiable/notifications', :action => 'dismiss',
                :id => message.id}))
        end
        content_tag(:div, header + body, base_options)
      end

      def notify_for(obj, options={})
        messages = obj.notificaions.select(&:viewable?).
          map {|msg| notify_msg(msg, options)}
        messages.join("\n")
      end

      def notifications(options={})
        Notification.global.viewable.map {|msg| notify_msg(msg, options)}.join("\n")
      end

      def static_notification(level, header, options={}, &block)
        header = header_div(header, level)
        body   = capture(&block)

        concat(content_tag(:div, header + body, {:class => "notify #{level}"}.merge(options)), block.binding)
      end

      private

      def header_div(text, level)
        content_tag(:div, content_tag(:span, text, :class => level), :class => "notify-header #{level}")
      end
      
    end
  end
end