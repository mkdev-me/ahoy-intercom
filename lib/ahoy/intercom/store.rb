require 'ahoy_matey'
require 'intercom'

module Ahoy
  module Intercom
    class Store < ::Ahoy::Stores::ActiveRecordStore

      def intercom
        @intercom ||= Intercom::Client.new(credentials)
      end

      def track_event(name, properties, options, &block)
        super do |event|
          create(event)
        end
      end

      private

      def create(event)
        intercom.events.create(
          event_name: event.name,
          email: event.user.email,
          user_id: event.user.id,
          created_at: event.time.to_i,
          metadata: event.properties
        )
      end

      def credentials
        {
          app_id: ENV['INTERCOM_APP_ID'],
          api_key: ENV['INTERCOM_APP_SECRET'],
          token: ENV['INTERCOM_ACCESS_TOKEN']
        }
      end
    end
  end
end
