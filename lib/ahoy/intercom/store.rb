require 'ahoy_matey'
require 'intercom'
require 'logger'

module Ahoy
  module Intercom
    class Store < ::Ahoy::Stores::BaseStore

      def track_event(name, properties, options)
        intercom.events.create(
          event_name: name,
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

      def intercom
        @intercom ||= ::Intercom::Client.new(credentials)
      end

      def credentials
        { token: ENV['INTERCOM_ACCESS_TOKEN']}
      end
    end
  end
end
