require 'ahoy_matey'

module Ahoy
  module Intercom
    class Store < ::Ahoy::Stores::BaseStore

      def track_event(name, properties, options)
        save_to_intercom(name, properties, options)
      end

      def intercom
        @intercom ||= ::Intercom::Client.new(token: ENV['INTERCOM_ACCESS_TOKEN'])
      end

      def save_to_intercom(event_name, properties, options)
        intercom.events.create(
          event_name: event_name,
          email: ahoy.user.email,
          user_id: ahoy.user.id,
          created_at: options[:time],
          metadata: properties
        )
      rescue ::Intercom::IntercomError => e
        logger = Logger.new(STDOUT)
        logger.level = Logger::WARN
        logger.warn(e.message)
      end
    end
  end
end
