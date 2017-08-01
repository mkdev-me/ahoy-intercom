require 'intercom'
require 'ahoy/intercom/client'
require 'logger'

module Ahoy
  module Intercom
    module Tracker
      include Client

      def save_to_intercom(event_name, properties = {})
        intercom.events.create(
          event_name: event_name,
          email: ahoy.user.email,
          user_id: ahoy.user.id,
          created_at: Time.now.to_i,
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
